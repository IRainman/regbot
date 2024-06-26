import {
  ConversationFn,
  createConversation as createDefaultConversation,
} from "@grammyjs/conversations";
import { Filter, FilterQuery } from "grammy";
import moment from "moment-timezone";

import { Context, Conversation } from "#root/bot/context.js";
import { logger as loggerMw } from "#root/bot/middlewares/index.js";
import { config } from "#root/config.js";

type StringOrStringLiteral<T> = T extends string
  ? string extends T
    ? string
    : T
  : string;

export function createConversation(fn: ConversationFn<Context>) {
  const wrappedFn = async (conversation: Conversation, ctx: Context) => {
    // Fixup logger before entering a conversation.
    await conversation.run(loggerMw());
    return fn(conversation, ctx);
  };
  return createDefaultConversation(wrappedFn, { id: fn.name });
}

export async function waitForSkipCommands<Q extends FilterQuery, C>(
  conversation: Conversation,
  filter: Q | Q[],
  allowedCommands?: StringOrStringLiteral<C>[],
): Promise<
  | { reply: Filter<Context, "message:text">; command: C }
  | { reply: Filter<Context, Q>; command: undefined }
> {
  const reply = await conversation.waitUntil(
    (ctx) =>
      (ctx.has(filter) && ctx.entities("bot_command").length === 0) ||
      (ctx.has("message:text") &&
        ctx.entities("bot_command").length === 1 &&
        (allowedCommands ?? []).reduce(
          (prev, cmd) => prev || ctx.hasCommand(cmd),
          false,
        )),
  );

  if (reply.entities("bot_command").length > 0) {
    return {
      reply: reply as Filter<Context, "message:text">,
      command: reply.entities("bot_command")[0].text.slice(1) as C,
    };
  } else {
    return {
      reply: reply as Filter<Context, Q>,
      command: undefined,
    };
  }
}

export async function waitForDate<C extends string>(
  conversation: Conversation,
  ctx: Context,
  errorMessage: string,
  errorPastDateMessage: string,
  allowedCommands: StringOrStringLiteral<C>[],
): Promise<
  ({ date: Date; command: undefined } | { date: undefined; command: C }) & {
    reply: Filter<Context, "message:text">;
  }
>;
export async function waitForDate(
  conversation: Conversation,
  ctx: Context,
  errorMessage: string,
  errorPastDateMessage: string,
): Promise<{ date: Date; reply: Filter<Context, "message:text"> }>;
export async function waitForDate(
  conversation: Conversation,
  ctx: Context,
  errorMessage: string,
  errorPastDateMessage: string,
  allowedCommands?: string[],
) {
  while (true) {
    const { reply, command } = await waitForSkipCommands(
      conversation,
      "message:text",
      allowedCommands,
    );
    if (command !== undefined) {
      return { command, reply };
    }

    const timestamp = moment.tz(
      reply.message.text,
      "YYYY-MM-DD HH:mm",
      true,
      config.TIMEZONE,
    );

    if (!timestamp.isValid()) {
      await ctx.reply(errorMessage, {
        reply_to_message_id: reply.message.message_id,
      });
      continue;
    }

    if (timestamp.isBefore(moment.now())) {
      await ctx.reply(errorPastDateMessage, {
        reply_to_message_id: reply.message.message_id,
      });
      continue;
    }

    return {
      date: timestamp.toDate(),
      reply,
    };
  }
}

export async function maybeExternal<T>(
  conversation: Conversation | null,
  closure: () => Promise<T>,
): Promise<T> {
  if (conversation === null) {
    return closure();
  } else {
    return conversation.external(closure);
  }
}
