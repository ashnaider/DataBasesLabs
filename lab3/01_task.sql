-- 1. По заданной (с помощью заголовка) работе получить список сообщений с указанием имен их авторов,
-- отсортированный в хронологическом порядке.

create or replace function GetAuthorOfMessage (mess_id integer)
    returns name_domain

    AS $$
    DECLARE
        curr_fr_id  integer;
        curr_job_id integer;
        curr_is_from_customer bool;
        author_name  name_domain;

    BEGIN
        select freelancer_id, job_id, is_from_customer into curr_fr_id, curr_job_id, curr_is_from_customer
            from message_ where message_.id = mess_id;

        IF curr_is_from_customer = True THEN
            select first_name into author_name from customer
                    where customer.id = (select customer_id from new_job
                        where new_job.id = curr_job_id);
        ELSE
            select first_name into author_name from freelancer where freelancer.id = curr_fr_id;
        END IF;
        RETURN author_name;
    END;
    $$ language plpgsql;


select * from GetMessageAuthor(1);


select text_message, GetAuthorOfMessage(message_.id) as Author from message_
    where message_.job_id = (select new_job.id from new_job
        where new_job.header_ = 'Сверстать landing page для булочной')
    order by message_.date_time ASC;


select text_message, GetAuthorOfMessage(message_.id) as Author from message_
    where message_.job_id = (select new_job.id from new_job
        where new_job.header_ = 'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д)')
    order by message_.date_time ASC;




select  text_message,
		case
			when is_from_customer = True then customer.first_name
			when is_from_customer = False then fr.first_name
		end as author_name,
		header_, specialization

		from message_ mess
	inner join new_job on (mess.job_id = new_job.id and new_job.header_ = 'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д)')
	left join freelancer fr on mess.freelancer_id = fr.id
	left join customer on customer.id = mess.job_id
    order by mess.date_time ASC;



