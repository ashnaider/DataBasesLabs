drop function if exists GetAuthorOfMessage;
drop table technology_stack;
drop table technology;

drop table project_done;
drop table job_complaint;
drop table user_complaint;
drop type complaint_type;

drop table message_;

drop table application;
drop table new_job;

drop table customer;
drop table freelancer;

drop domain email_domain;
drop domain password_domain;
drop domain name_domain;
drop domain login_domain;

create table technology (
	id serial not null primary key,
	tech_name varchar(250) not NULL
);


create domain email_domain as varchar(150)
	check(
		value ~* '^[a-z0-9._%-]+@[a-z0-9._%-]+\.[a-z]{2,4}'
	);

create domain password_domain as varchar(50)
	check (
		value ~ '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$'
	);

create domain name_domain as varchar(50)
	check (
		value ~ '^[A-Z][a-z\-]{1,48}'
	);

create domain login_domain as varchar(50)
	check (
		value ~ '[a-z0-9]{5,48}'
	);

create table freelancer (
	id serial not null primary key,
	email email_domain not null,
	login login_domain not null unique,
	password_ password_domain not null,
	first_name name_domain not null,
	last_name name_domain not null,
	resume_link varchar(250),
	specialization varchar(250) not null
);

create table technology_stack (
	technology_stack_id serial not null primary key,

	freelancer_id int not null
		references freelancer(id)
		on delete cascade on update cascade,

	technology_id int not null
		references technology(id)
		on delete cascade on update cascade,

	unique(freelancer_id, technology_id)
);


create table customer (
	id serial not null primary key,
	login login_domain not null,
	password_ password_domain not null,
	email email_domain not null,
	first_name name_domain not null,
	last_name name_domain,
	organisation_name varchar(150)
);


create table new_job (
	id serial not null primary key,
	customer_id int not null
		references customer(id)
		on delete restrict on update cascade,

    posted timestamp not null check (posted >= CURRENT_TIMESTAMP),
	deadline timestamp   not null check (deadline > CURRENT_TIMESTAMP),
	header_ varchar(250) not null,
	description varchar(650) not null,
	price money not null check (price > 0::money),
	hourly_rate money not null check (hourly_rate > 0::money),
	is_done bool default false
);


create table application (
	id serial not null primary key,
	date_time timestamp not null default CURRENT_TIMESTAMP,
	deadline timestamp not null check (deadline > date_time),
	price money not null,
	description varchar(450) not null,

	freelancer_id int not null
		references freelancer(id)
		on delete restrict on update cascade,

	job_id int not null
		references new_job(id)
		on delete restrict on update cascade
);


create type complaint_type as enum (
	'inappropriate_content',
	'fraud',
	'illegal_actions',
    'spam',
	'other'
);


---Freelancer's complaint on the new_job
create table job_complaint (
	id serial not null primary key,
	date_time timestamp not null default CURRENT_TIMESTAMP,
	complaint_type complaint_type not null,
	description varchar(550),

	freelancer_id int not null
		references freelancer(id)
		on delete restrict on update cascade,

	job_id int not null
		references new_job(id)
		on delete restrict on update cascade
);


---Customer's complaint on freelancer,
-----or freelancer's complaint on customer
create table user_complaint (
	id serial not null primary key,
	date_time timestamp not null default CURRENT_TIMESTAMP,
	is_from_customer bool not null,
	complaint_type complaint_type not null,
	description varchar(550),

    customer_id int not null
		references customer(id)
		on delete restrict on update cascade,

	freelancer_id int not null
		references freelancer(id)
		on delete restrict on update cascade
);


---Message between customer and freelancer
------both can write each other
create table message_ (
	id serial not null primary key,
	is_from_customer bool not null,
	date_time timestamp not null default CURRENT_TIMESTAMP,
	text_message text not null,

	freelancer_id int not null
		references freelancer(id)
		on delete restrict on update cascade,

	job_id int not null
		references new_job(id)
		on delete restrict on update cascade
);


create table project_done (
	id serial not null primary key,
	date_start timestamp not null,
	date_finish timestamp not null check (date_finish > date_start),

	customer_review varchar(350) not null,
	freelancer_review varchar(350) not null,

	freelancer_id int not null
		references freelancer(id)
		on delete restrict on update cascade,

	job_id int not null
		references new_job(id)
		on delete restrict on update cascade
);

