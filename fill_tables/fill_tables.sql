
-----FILL TECHNOLOGY----
insert into technology (tech_name) values
	('Python3'),
	('Django'),
	('Flask'),
	('AWS'),
	('PyCharm'),

	('Pandas'),
	('NumPy'),
	('Seaborn'),
	('Tableau'),

	('OpenCV'),
	('Tensorflow'),
	('Keras'),
	('PyTorch'),

	('SQL'),
	('PostgreSQL'),
	('MySQL'),
	('Oracle'),
	('Microsoft SQL Server'),

	('C/C++'),
	('Linux'),
	('Linux Kernel'),
	('FFMPEG'),
	('Bash/Zsh'),
	('GDB'),
	('GCC'),
	('CLang/LLVM'),
	('Visual Studio'),
	('CLion'),

	('Ruby'),
	('RubyOnRails'),

	('HTML'),
	('CSS'),
	('JavaScript'),
	('TypeScript'),
	('React'),
	('Vue'),
	('Angular'),
	('Node.js'),

	('Java'),
	('Spring'),
	('InteliJ'),
	('Kotlin'),
	('Android'),

	('Objective-C'),
	('Swift'),
	('IOS'),

	('C#'),
	('.NET Core'),
	('WinForms'),
	('WPF'),
	('Azure'),

    ('Gradle'),
    ('Docker'),
    ('Kubernetes'),
    ('Jenkins'),
	('git/github')
	;


-----FILL FREELANCER-----
insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Celle', 'Whitlaw', 'cwhitlaw0@patch.com', 'cwhitlaw0', 'asdfWER45',
                                                                                                'Python developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Mill', 'Cruddas', 'mcruddas1@wired.com', 'mcruddas1', 'CBrm1TR45',
                                                                                                'Data Analyst');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Tuesday', 'McGorley', 'tmcgorley2@themeforest.net', 'tmcgorley2', '72VTsdf1S',
                                                                                                'Front-end developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Ealasaid', 'Attewill', 'eattewill3@delicious.com', 'eattewill3', 'Us5HsyXHjtBr',
                                                                                                'Front-end developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Tammara', 'Folkard', 'tfolkard4@oakley.com', 'tfolkard4', 'i4NYX3qXmZbW',
                                                                                                'Full Stack developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Guthry', 'Dorian', 'gdorian5@cisco.com', 'gdorian5', 'c0mv0ds0Nn',
                                                                                                'Back-end .Net developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Delmar', 'Keems', 'dkeems6@uol.com.br', 'dkeems6', '9ChyRmZIT1',
                                                                                                'Machine Learning engineer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Abraham', 'McLernon', 'amclernon7@archive.org', 'amclernon7', 'ZhqHhdf3',
                                                                                                'Data Scientist');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Sawyere', 'Moorton', 'smoorton8@goo.ne.jp', 'smoorton8', '7G6vx7vS',
                                                                                                'Java developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Ruthy', 'Norwell', 'rnorwell9@tiny.cc', 'rnorwell9', 'TpXZs34l',
                                                                                                'Android developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Elsa', 'Risman', 'erismana@whitehouse.gov', 'erismana', '6s6u7onQ',
                                                                                                'IOS developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Giovanni', 'Dunnaway', 'gdunnawayb@over-blog.com', 'gdunnawayb', 'CbVG9ZqZsUOx',
                                                                                                'C++ developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Laural', 'Brun', 'lbrunc@buzzfeed.com', 'lbrunc', '797IDrmZQb',
                                                                                                'Data Engineer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Malissia', 'Kee', 'mkeed@tmall.com', 'mkeed', 'AuieuptGP1',
                                                                                                'Back-end developer');

insert into freelancer (first_name, last_name, email, login, password_, specialization) values ('Edvard', 'Swadlen', 'eswadlene@vistaprint.com', 'eswadlene', 'uWvg234VNI',
                                                                                                'DevOps');

----FILL TECHNOLOGY STACK-----
insert
    into technology_stack (freelancer_id, technology_id)
        values
            (1, 1),
            (1, 2),
            (1, 3),
            (1, 4),
            (1, 5),
            (1, 14),
            (1, 16),
            (1, 56),

            (2, 1),
            (2, 4),
            (2, 5),
            (2, 6),
            (2, 7),
            (2, 8),
            (2, 9),
            (2, 14),
            (2, 15),

            (3, 31),
            (3, 32),
            (3, 33),
            (3, 35),
            (3, 37),
            (3, 56),

            (4, 31),
            (4, 32),
            (4, 33),
            (4, 34),
            (4, 37),
            (4, 56),

            (5, 29),
            (5, 30),
            (5, 31),
            (5, 32),
            (5, 33),
            (5, 35),
            (5, 36),
            (5, 56),

            (6, 47),
            (6, 48),
            (6, 49),
            (6, 50),
            (6, 51),
            (6, 56),

            (7, 1),
            (7, 4),
            (7, 5),
            (7, 10),
            (7, 11),
            (7, 12),
            (7, 13),
            (7, 20),
            (7, 23),
            (7, 56),

            (8, 1),
            (8, 5),
            (8, 6),
            (8, 7),
            (8, 8),
            (8, 12),
            (8, 14),
            (8, 16),
            (8, 56),

            (9, 39),
            (9, 40),
            (9, 41),
            (9, 31),
            (9, 32),
            (9, 33),
            (9, 56),

            (10, 39),
            (10, 41),
            (10, 42),
            (10, 43),
            (10, 52),
            (10, 31),
            (10, 32),
            (10, 33),
            (10, 56),

            (11, 44),
            (11, 45),
            (11, 46),
            (11, 56),

            (12, 19),
            (12, 20),
            (12, 21),
            (12, 22),
            (12, 23),
            (12, 24),
            (12, 25),
            (12, 28),
            (12, 1),
            (12, 56),

            (13, 1),
            (13, 4),
            (13, 6),
            (13, 14),
            (13, 15),
            (13, 16),
            (13, 18),
            (13, 51),
            (13, 53),
            (13, 56),

            (14, 1),
            (14, 2),
            (14, 3),
            (14, 47),
            (14, 48),
            (14, 56),

            (15, 1),
            (15, 4),
            (15, 14),
            (15, 15),
            (15, 51),
            (15, 52),
            (15, 53),
            (15, 54),
            (15, 55),
            (15, 56)
;



-----FILL CUSTOMER-----
insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Alick', 'Nehls', 'anehls0', 'anehls0@livejournal.com', 'M5hea450', 'Entertainment Gaming Asia Incorporated');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Ravi', 'Shillinglaw', 'rshillinglaw1', 'rshillinglaw1@spotify.com', 'TiuFCZ3ujclw', 'Rogers Corporation');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Karyn', 'Hargie', 'khargie2', 'khargie2@fema.gov', 'VwirYdtf45xU', 'SunTrust Banks, Inc.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Petrina', 'Cassell', 'pcassell3', 'pcassell3@shutterfly.com', '18R49DFib', 'Herbalife LTD.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Esmaria', 'Tench', 'etench4', 'etench4@topsy.com', 'kXAIwEZ45DG', 'D/B/A Chubb Limited New');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Therine', 'Kilgannon', 'tkilgannon5', 'tkilgannon5@hp.com', '2nEF7u23Cid', 'Drive Shack Inc.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Rolph', 'Cottham', 'rcottham6', 'rcottham6@ezinearticles.com', 'fC3YMarFtXF', 'iShares PHLX SOX Semiconductor Sector Index Fund');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Marieann', 'Checketts', 'mchecketts7', 'mchecketts7@homestead.com', 'QHgF3CHxw59', 'Nuveen Floating Rate Income Fund');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Beulah', 'MacKaig', 'bmackaig8', 'bmackaig8@weibo.com', 'g5rt9Q8h', 'Blackrock Capital and Income Strategies Fund Inc');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Amby', 'Tilzey', 'atilzey9', 'atilzey9@addthis.com', 'leQ7YjaXD1ez', 'First Trust Low Duration Opportunities ETF');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Ivan', 'Sergeev', 'ivserg1234', 'sergeev_ivan77@gmail.com', 'lzRET453sd', 'ООО ''Рога и Копыта''');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Viole', 'Paulon', 'vpaulon0', 'vpaulon0@seattletimes.com', '24abY0dfU', 'Pointer Telocation Ltd.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Mela', 'Canning', 'mcanning1', 'mcanning1@sourceforge.net', 'OgVqJl239', 'J.C. Penney Company, Inc. Holding Company');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Alfons', 'Margach', 'amargach2', 'amargach2@cnet.com', 'gfbCoJz234g', 'Gardner Denver Holdings, Inc.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Freddi', 'Sillars', 'fsillars3', 'fsillars3@psu.edu', 'Wne6tIOQ3loP', 'PrivateBancorp, Inc.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Lonnie', 'Self', 'lself4', 'lself4@ucoz.ru', 'eXm2dBBay', 'FormFactor, Inc.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Hasty', 'Diperaus', 'hdiperaus5', 'hdiperaus5@domainmarket.com', 'zgOU1cjjTami', 'Sina Corporation');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Jacques', 'Gini', 'jgini6', 'jgini6@vistaprint.com', 'PSE1ANM3FSOg', 'Teekay Tankers Ltd.');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Molly', 'Brando', 'mbrando7', 'mbrando7@gov.uk', 'dg2MS6BdCjuk', 'Kimco Realty Corporation');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Terrijo', 'Haughton', 'thaughton8', 'thaughton8@tinyurl.com', 'uTwe234KkTD', 'Mattersight Corporation');

insert into customer (first_name, last_name, login, email, password_, organisation_name) values
    ('Patric', 'Hargerie', 'phargerie9', 'phargerie9@dailymail.co.uk', '0cJI4lLclc', 'Fifth Street Asset Management Inc.');



-----FILL CUSTOMER-----
insert into new_job (customer_id, deadline, header_, description, price, hourly_rate)
    values
         (1, '2023-03-22 18:10:25-07',
               'Сверстать landing page для булочной',
               'Необходимо сверстать лендинг для сети булочных. Дизайн готов и представлен в figma.',
               money(170), 2),

         (2, '2023-01-4 12:00:00-00',
             'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д) ',
             'Нужно создать кнопку со ссылкой типо "поделиться". нажав на которую произойдет 2 вещи:' ||
             '1) Всплывет на к примеру VK (стандартная вещь как у всех) на том же яндексе кнопках' ||
             '2) Над кнопкой на прогресс баре появиться значение 10%',

               money(30), 1.7),

        (1, '2023-02-1 6:10:25-00',
            'Создать одностраничный сайт - Продажа автозапчастей',
            'Создать продающий лендинг, далее будет запускаться контекст' ||
            'Контент есть ',
               money(170), 2),

        (4, '2023-08-30 23:00:00-00',
            'Создание бэкэнда для сервиса геймификации на Django',
            'Нужно создать бэкэнд для сервиса геймификации на Django ориентируясь на приложенное техническое задание',
               money(400), 3),

        (5, '2023-02-16 16:30:00-00',
            'Восстановить работу Ebay API ',
            ' Есть старый самописный модуль на PHP, лет 5 работавший с Ebay API shopping. После того как Ebay что-то сломал, модуль перестал работать и возвращает ошибку 1199, решения по которой не гуглятся.' ||
            'Задача — или восстановить работу этого модуля, или прикрутить библиотеку на ваш выбор.' ||
            'Все доступы-токены-пароли для Ebay есть.' ||
            'Проект на Гитхабе.',
               money(50), 2),

        (2, '2023-05-05 00:00:00-00',
            'Доработка мобильного приложения на Kotlin под Android',
            'Нужен разработчик для доработка Android-приложения (Kotlin).\n' ||

            'Нужно реализовать поддержку нескольких новых методов API (бэкэнда) и устранить ряд замечаний по UI. Детали при личном общении.\n' ||

            'Стек: Kotlin, Dagger, RxJava2, Retrofit, Room, Google Maps.',
               money(350), 4),

        (4, '2023-07-25 20:00:00-6',
            'Ruby проект',
            'Здравствуйте! Мы в поисках рубиста для работы в коммерческом проекте. Стёк: Rails4, ruby 2.4 ActiveAdmin. Если знакомы с webpacker, vue.js, .slim - только плюс. Уровень strong junior або middlе. Больше деталей при обсуждении.',
               money(550), 5),

        (5, '2023-06-8 12:00:00-00',
            'Бекенд для сбора данных и отправки задач на др.сервер ',
            'Сделать сервис, получающий данные относительно пользовательских файлов, инструкцию относительно того что необходимо сделать с этими данными и отправлять на сервер который работает с этими данными.\n' ||
            '1. Получать запросы от четырех серверов\n' ||
            'Каждый из запросов хорошо сформулирован, сейчас нужно написать инструкцию в постмане на них.\n' ||
            '2. Обрабатывать информацию и сохранять в Postgres\n'||
            '3. Рассчитывать следующие файлы для осуществления работы с ними и отправлять имя, адрес файла и инструкцию о работе. Принимать ответ и записывать его в БД',
               money(770), 6),

        (6, '2023-03-5 19:50:25-03',
            'Собрать RTSP потоки с 4-х камер и объединить в один',
            'Добрый день. Есть 4ые локальные IP камеры. Требуется собрать с каждой камеры RTSP поток объединить в один, сложив картинки с каждой камеры в ряд и получить один RTSP поток.\n'||
            'Разрешение с каждой камеры желательно HD, битрейт 500-1000, фпс 10-12 ',
               money(350), 4),

        (2, '2023-09-1 13:13:13-13',
            'Разработать мобильное приложение на Kotlin и Swift ',
            'Нужно создать MVP мобильного на Kotlin (Android), Swift (iOS) + написать серверную часть на GO или Python + базу данных Postgres.\n'||
            'Дизайн и прототип уже готовы.',
               money(950), 5),

        (3, '2023-04-4 17:23:29-7',
            'Сиздать систему подсчёта хлебов на конвеере',
            'Есть конвеер, на котором едут буханки хлеба, над ним находится камера, зафиксированная в одном положении. ' ||
            'Необходимо производить точный подсчёт продукции.',
               money(850), 10),

        (7, '2023-08-17 06:10:15-00',
            'Написать мобильное кроссплатформенное приложение для интернет-магазина ',
            'Для интернет-магазина безалкогольных напитков необходимо написать кроссплатформенное мобильное приложение на Android и IOS. Дизайн на стороне заказчика. Мобильное приложение похоже на приложение Азбуки вкуса. \n' ||
            'Методы по API с сайта должны передаваться в мобильное приложение.',
               money(700), 4),

        (8, '2023-01-19 14:10:27-2',
            'Добавить в docker контейнер поддержку сертификатов Let''s Encrypt',
            'Нужно:\n1. Добавить в процедуру билда докера (скрипт create.sh) параметр "domain", который будет содержать имя домена, и для него генерировать SSL сертификат через Let''s Encrypt внутри докера. Файл сертификата должен размещаться в каталоге /root/cert/. \n'||
            '2. Добавить в cron файл (он уже есть) процедуру обновления сертификата, чтобы он не экспайрился.',
               money(170), 2),

        (9, '2023-04-12 15:00:30-00',
            'Разработать NLP-модель классификации медицинских текстов',
            'Общая задача: по данным электронной медицинской карты (набор текстов во времени) определить были ли исполнены критерия качества оказания помощи.\n' ||
            'Ограничения: данные в карте могут быть неполными или не соответствовать диагнозу, приемов может быть несколько в рамках лечения одного кейса.',
               money(2200), 14),

        (10, '2023-05-01 00:10:25-6',
            'Нужно разработать алгоритм автоматического составления расписания ',
            'Нужно разработать алгоритм автоматического составления расписания ориентируясь на приложенное техническое задание',
               money(350), 6),



        (11, '2023-03-10 12:13:14-5',
            'Ставки на спорт!!',
            'Ставки на спорт!! Высокие коэффициенты!!',
               money(3000), 13),

        (11, '2023-03-11 14:15:27-00',
            'Быстрый займ!!!',
            'Быстрые займы!!! Нужен только паспорт!!! Низкий процент!!!',
               money(4500), 12),

        (12, '2023-01-18 19:10:25-07',
            'Взломать страницу ВК',
            'Нужно взломать страницу ВК, ссылку скину в личные сообщения',
               money(150), 8),

        (13, '2023-02-28 00:00:00-00',
            'Доработать систему оплаты и подмену целевой ссылки в онлайн казино',
            'Имеется онлайн казино, где оплата происходит картой, но при вводе данных, нужно произвести подмену ссылки\n ' ||
            'и перевести пользователя по указанному адресу.',
               money(1000), 10),

        (14, '2023-04-7 15:00:30-00',
            'Сверстать точную копию сайта Vodafone.ua',
            'Необходимо сверстать точную копию сайта Vodafone.ua и выставить на хостинг с доменом Voodaafone.ue',
               money(700), 6)
;




-----FILL APPLICATION-----
insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-02-04', '2023-07-15', 724::money, 'Есть большой опыт подобных решений, готов взяться сегодня!', 5, 7);

insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-01-23', '2023-12-20', 2617::money, 'Профессионал с отличной экспертизой. Решу за неделю', 5, 3);

insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-02-13', '2023-08-26', 539::money, 'Разработчик с опытом 4 года, качественно решу вашу задачу', 10, 12);

insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-02-03', '2023-09-17', 1113::money, 'Имею обширный опыт построения подобных систем, гарантирую качество и надёжность', 13, 8);

insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-01-21', '2023-10-18', 1222::money, 'C++ разработчик. Имею опыт работы с высоконагруженными системами и решениями для видеосвязи.', 12, 9);

insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-02-01', '2023-05-16', 2679.56, '2 года опыта в сфере администрирования. Настрою всё по красоте)', 15, 13);

-- insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
--     ('2023-01-22', '2023-05-28', '$721.61');
--
-- insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
--     ('2023-01-06', '2023-07-02', '$775.86');
--
-- insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
--     ('2023-01-17', '2023-08-08', '$1229.15');
--
-- insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
--     ('2023-01-08', '2023-11-24', '$1277.25');



------FILL MESSAGE_ ------
insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-02-25 14:10:00-00', false, 'Здравствуйте, можете поподробнее рассказать о проблеме?', 3, 1);

insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-07-03 02:16:07-00', false, 'Добрый день, какой фреймворк используется на сайте?', 3, 2);

insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-01-27 12:20:15-00', false, 'Добрый вечер, готов сделать за неделю.', 4, 3);

insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-12-09', false, 'Здравствуйте, в каком формате дизайн и на каком фреймворке готов прототип?', 10, 10);

insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-05-06', false, 'Добрый день, какие требования к модели и какие данные есть?', 7, 14);

insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-01-12', false, 'Здравствуйте, готов приступить к разработке IOS приложения. Можете выслать ТЗ?', 11, 10);

insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
    ('2022-01-24', true, 'Добрый вечер, заинтересовала ваша заявка, когда сможете приступить к проекту?', 5, 13);

-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-07-22');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-11-08');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-10-31');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-03-28');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-02-28');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-04-18');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-08-22');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-01-03');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-05-30');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-01-01');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-02-18');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-05-09');
--
-- insert into message_ (date_time, is_from_customer, text_message, freelancer_id, job_id) values
--     ('2022-02-04');


----FILL PROJECT_DONE----
insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
    values ('2023-02-21', '2023-11-21', 5, 7, 'Приятный человек, поставляет хорошие ТЗ', 'Профессионал своего дела');

insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
    values ('2023-03-13', '2023-07-13', 5, 3, 'Ответственный заказчик, своевременная оплата', 'Исполнительный и старательный разработчик');

insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
    values ('2023-02-22', '2023-11-20', 10, 12, 'Хороший человек, спокойно объясняет правки', 'Медлительный но внимательный специалист');

insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
    values ('2023-04-01', '2023-06-29', 13, 8, 'Безответственный заказчик, постоянно куда-то пропадает', 'Непунктуальный разработчик, не соблюдает тайминги');

insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
    values ('2023-03-19', '2023-08-25', 12, 9, 'Нормальный заказчик, но периодически не отвечает на смс', 'Назойливый и грубоватый разработчик, постоянно пишет');
--
-- insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
--     values ('2023-02-21', '2023-12-15', 0, 0, '', '');
--
-- insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
--     values ('2023-03-01', '2023-12-25', 0, 0, '', '');
--
-- insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
--     values ('2023-03-21', '2023-10-26', 0, 0, '', '');
--
-- insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
--     values ('2023-03-31', '2023-06-20', 0, 0, '', '');
--
-- insert into project_done (date_start, date_finish, freelancer_id, customer_id, freelancer_review, customer_review)
--     values ('2023-02-22', '2023-10-06', 0, 0, '', '');
--



-- 	'inappropriate_content',
-- 	'fraud',
-- 	'illegal_actions',
--     'spam',
-- 	'other'

----FILL JOB_COMPLAINT----
insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-04-17 16:39:23', 'spam', 'Спам-реклама ставок на спорт', 6, 16);

insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-02-03 21:56:58', 'fraud', 'Реклама микрокредитов в качестве объявления', 2, 17);

insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-02-23 08:28:04', 'spam', 'Администрация, вы куда смотрите? у вас спам по объявлениям гуляет', 12, 16);

insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-01-06 07:30:49', 'illegal_actions', 'Размещено объявление, цель которого нарушить право '||
                                               'на личную переписку и доступ к личным данным', 9, 18);

insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-06-22 17:15:03', 'fraud', 'Заказ для казино, для подмены ссылки и обмана пользователей, '||
                                     'админ, удали объявление', 1, 19);

insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-07-26 11:51:47', 'other', 'Неадекватоне задание. Решение NP-полной задачи, вы серьезно?', 8, 15);
--
-- insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
--     ('2023-07-14 19:00:39', '', '', 0, 0);
--
-- insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
--     ('2023-07-31 05:33:16', '', '', 0, 0);
--
-- insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
--     ('2023-08-29 07:49:32', '', '', 0, 0);
--
-- insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
--     ('2023-11-26 23:01:40', '', '', 0, 0);



----FILL USER_COMPLAINT-----
insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
    values ('2023-07-23 06:44:36', false, 'fraud', 'Человек обманывает и кидает людей. На звонки и смс не отвечает', 4, 9);

insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
    values ('2023-06-25 20:04:51', false, 'spam', 'Заказчик неадекватный, требует выполнить работу за копейки, хотя я даже не подавал заявку', 8, 2);

insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
    values ('2023-05-15 18:41:19', false, 'illegal_actions', 'Заказчик предлагает провести оплату окольными путями, в обход налогов', 10, 5);

insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
    values ('2023-11-24 17:49:14', false, 'inappropriate_content', 'У исполнителя неприемливое фото на аватарке и странный ник', 1, 4);

insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
    values ('2023-10-04 23:25:52', false, 'spam', 'Исполнитель слишком навящивый, написывает о исполнении проекта, хотя я даже его не подтверждал', 2, 11);
--
-- insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
--     values ('2023-08-31 20:33:14', false, '', '', 0, 0);
--
-- insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
--     values ('2023-08-24 19:42:59', false, '', '', 0, 0);
--
-- insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
--     values ('2023-08-18 01:59:50', false, '', '', 0, 0);
--
-- insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
--     values ('2023-08-05 16:00:54', false, '', '', 0, 0);
--
-- insert into user_complaint (date_time, is_from_customer, complaint_type, description, customer_id, freelancer_id)
--     values ('2023-10-29 17:48:09', false, '', '', 0, 0);

