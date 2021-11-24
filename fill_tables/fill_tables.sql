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





