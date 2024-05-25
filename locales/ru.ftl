start_command = 
    .description = Запустить бот
language_command = 
    .description = Сменить язык / Change language
menu_command =
    .description = Открыть меню

welcome = Добро пожаловать!

language =
    .select = Пожалуйста, выберите язык
    .changed = Язык успешно изменён!

unhandled = Неизвестная команда.

edit_cache =
    .edited = (отредактировано {DATETIME($date, dateStyle:"short", timeStyle: "medium")})

interview =
    .i_dont_know_you = Я вас пока ещё не знаю, давайте знакомиться 👋
    .i_know_you = Вижу, вы уже прошли собеседование, но мне нужно уточнить пару деталей.

    .name = Как вас зовут?

    .pronouns = Какие местоимения вы используете?
    .pronouns_they_them = 🌻 Они/Их
    .pronouns_she_her = 🌸 Она/Её
    .pronouns_he_him = 🪻 Он/Его
    .pronouns_it_its = 🌿 Оно/Его
    .can_use_custom_pronouns = Можно указать местоимения не из списка...

    .gender = Какая у вас гендерная идентичность?
    .gender_nonbinary = 🐝 Небинарная персона
    .gender_woman = 🦊 Женщина
    .gender_man = 🐨 Мужчина
    .can_use_custom_gender = Можно указать идентичность не из списка...

    .sexuality = Какая у вас сексуальная ориентация?
    .sexuality_bisexual = 🍦 Бисексуальная/Пансексуальная
    .sexuality_homosexual = 🍉 Гомосексуальная
    .sexuality_heterosexual = 🥑 Гетеросексуальная
    .can_use_custom_sexuality = Можно указать идентичность не из списка...

    .multiline_questions =
        Пожалуйста, отвечайте не следующие вопросы подробно.
        Вы можете отправить несколько сообщений или голосовых записей.
        Чтобы перейти к следующему вопросу, отправьте боту команду /next.

    .send_more_replies = Отправьте ответ на вопрос перед тем, как нажимать /next.

    .next = Перейти к следующему вопросу.

    .rules =
        Прочитайте <a href="notion.so/taminomara/1f06a005adb344ffb0f3be28804bbd9f">наши правила</a>.
        Согласны ли вы соблюдать их?
    .rules_yes = 👍 Да
    .rules_no = 😔 Нет

    .areyou18 = Вам уже есть 18?
    .areyou18_yes = 👍 Да
    .areyou18_no = 😱 Нет

    .experience =
        Расскажите, есть ли у вас опыт посещения сексуальных и БДСМ вечеринок?
        Если да, то какой?
        Если нет, то чего вы ожидаете от такой вечеринки?

    .how_do_you_know_us =
        Откуда вы о нас узнали?

    .active_consent =
        Как вы понимаете, что такое активное согласие?
        Опишите пример ваимодействия с активным согласием?

    .lgbt_check =
        Как вы относитесь к ЛГБТК людям?
        Если бы вы увидели двух целующихся мужчин или женщин, как вам было бы с этим?

    .transgender_check =
        Как вы относитесь к трансгендерности и трансгендерным людям?
        Если бы вы начали с кем-то взаимодействовать, и в процессе выяснилось бы, что это трансгендерная персона, как бы вы отреагировали?

    .personal_borders =
        Как бы вы поступили, если бы на вечеринке к вам подошёл человек и начал взаимодействовать, не спросив разрешения?

    .replies_saved =
        Ответы сохранены ✨
        Вы сможете отредактировать их командой /menu.

    .interview_replies_saved =
        Ответы сохранены ✨ Скоро мы посмотрим их и вернёмся.
        Отредактировать личные данные можно командой /menu.

    .admin_message = Собеседование закончено, пользователь ждёт решения.

    .edit_name = Введите новое имя:
    .edit_pronouns = Введите новые местоимения:
    .edit_gender = Введите новую гендерную идентичность:
    .edit_sexuality = Введите новую сексуальную идентичность:
    .edit_success = Данные сохранены

    .finish_interview_first = Сначала нужно закончить собеседование.
    .edit_name_first = Сначала введите новое имя.
    .edit_pronouns_first = Сначала введите новые местоимения.
    .edit_gender_first = Сначала введите новую гендерную идентичность.
    .edit_sexuality_first = Сначала введите новую сексуальную идентичность.

admin_group =
    .topic_name = {$name} (@{$username})
    .topic_header =
        <b>Диалог с пользователем <a href="tg://user?id={$id}">{$name}</a></b>
    .message_question =
        ↩️ <b>Interview question</b>

        {$question}
    .message_info = ℹ️ <b>{$info}</b>

menu =
    .about =
        Имя: <b>{$name}</b>
        Местоимения: <b>{$pronouns}</b>
        Гендерная идентичность: <b>{$gender}</b>
        Сексуальная идентичность: <b>{$sexuality}</b>

    .back = ⬅️ Назад
    .me = Мой профиль
    .update = 🔃 Обновить
    .updated = ✅ Обновлено {DATETIME($date, dateStyle:"short", timeStyle: "medium")}
    .name = Имя
    .pronouns = Местоимения
    .gender = Гендерная идентичность
    .sexuality = Сексуальная идентичность
    .edit = ✏️ Редактировать
    .edit_prompt = Что вы хотите отредактировать?
    .edit_name = Имя
    .edit_pronouns = Местоимения
    .edit_gender = Гендерную идентичность
    .edit_sexuality = Сексуальную идентичность
