-- ЛР № 5 (триггеры и хранимые процедуры)
--
-- 1. Добавить в таблицы объявлений, заказчиков и фрилансеров поля,
-- указывающие на блокировку (предусмотрено задачами А10, А3, А7).
-- Составить триггер для блокирования объявлений (обновления значения соответствующего поля),
-- на которые подано больше 5 жалоб.


drop function if exists BLOCK_JOB_IF_5_COMPLAINTS();
drop trigger if exists AUDIT_JOBS on job_complaint;


--- Функция для подсчёта жалоб на конкретное объявление ---
create or replace function COUNT_JOB_COMPLAINTS(job_id_to_count integer) returns integer
as $$
    declare
        job_complaints integer := 0;

    begin
        select count(*) into job_complaints
        from new_job as nj
        left join job_complaint as jc
        on nj.id = jc.job_id
        where jc.job_id = job_id_to_count
        group by nj.id;

        if job_complaints is null
            then return 0;
        else
            return job_complaints;
        end if;
    end;
$$ language plpgsql;

select * from COUNT_JOB_COMPLAINTS(17);


--- Создадим функцию триггера ---
create or replace function BLOCK_JOB_IF_5_COMPLAINTS() returns trigger
    as $$
    begin
        if COUNT_JOB_COMPLAINTS(NEW.job_id) >= 5 then
            update new_job
                set is_blocked = true
                where id = NEW.job_id ;
        end if;

        return NEW;
    end;
$$ language plpgsql;

--- Создадим триггер ---
create trigger AUDIT_JOBS
    after insert or update on job_complaint
    for each row execute procedure BLOCK_JOB_IF_5_COMPLAINTS();


--- Получим кол-во жалоб по каждому объявлению ---
select
    new_job.id as job_id,
    new_job.customer_id,
    new_job.header_,
    new_job.description,
    new_job.price,
    count(job_complaint.job_id) as copmlaints_count

from new_job
left join job_complaint on new_job.id = job_complaint.job_id
group by (new_job.id, new_job.customer_id, new_job.header_, new_job.description, new_job.price)
order by copmlaints_count desc
;


--- Посмотрим заблокированные объявления ---
select
*
from new_job as nj
where nj.is_blocked = true;


--- Добавим жалоб ---
insert into job_complaint (date_time, complaint_type, description, freelancer_id, job_id) values
    ('2023-02-28 05:05:10', 'spam', 'Спам букмекеров, админы, проснитесь', 9, 17),

    ('2023-01-25 17:49:23', 'fraud',
     'Реклама конторы, которая занимается ставками и наживается на людях, заблокируйте объявление', 15, 17),

    ('2023-02-16 13:00:05', 'spam', 'Спам и реклама запрещённой конторы, модераторы, разберитесь', 12, 17),

    ('2023-03-01 21:20:01', 'fraud',
     'В объявлении, вместо содержания указана информация конторы займов, вероятно это мошеники, исправьте ', 13, 16),

    ('2023-02-09 16:39:27', 'spam', 'Админы, проснитесь, у вас реклама микрокредитов в объявлениях висит!!!', 4, 16);






