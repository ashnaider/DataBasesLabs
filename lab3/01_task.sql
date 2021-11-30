-- 1. По заданной (с помощью заголовка) работе получить список сообщений с указанием имен их авторов,
-- отсортированный в хронологическом порядке.

create or replace function GetMessageAuthor (mess_id integer)
    returns varchar(50)

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


select * from GetMessageAuthor(7);