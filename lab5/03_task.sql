-- ЛР № 5 (триггеры и хранимые процедуры)
--
-- 3. Составить триггер,
-- который при написании фрилансером сообщения о готовности взяться за работу
-- будет проверять, существует ли уже договоренность
-- между заказчиком и другим фрилансером о выполнении данной работы.
-- Если такая договоренность существует, то фрилансер, написавший сообщение,
-- должен получить предупреждение о том, что эту работу уже выполняет кто-то другой.


drop trigger if exists AUDIT_APPLICATIONS on application;
drop function if exists AUDIT_APPLICATION_F();


--- Пускай в данный момент выполняются проекты 1 и 2 ---
update new_job set status = 'in progress' where new_job.id in (1, 2);

--- Выберем все выполняющиеся проекты ---
select *
from new_job
where status = 'in progress';


--- Создадим функцию триггера ---
create or replace function AUDIT_APPLICATION_F() returns trigger
    as $$
    declare
        pr_status project_status;
        pr_header text;

    begin
        select
               new_job.status, new_job.header_
        into pr_status, pr_header
        from new_job
        where new_job.id = NEW.job_id;

        if pr_status = 'in progress' then
            raise warning 'Project (id = %, header = "%") already in progress!', NEW.job_id, substr(pr_header, 0, 40);
        end if;

        return NEW;
    end;
$$ language plpgsql;


--- Создадим триггер ---
create trigger AUDIT_APPLICATIONS
    before insert on application
    for each row execute procedure AUDIT_APPLICATION_F();

--- Выполнится с предупреждением ---
insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-01-13 11:39:02-00', '2023-02-02', money(250), 'Имею необходимые навыки, готов приступуть к проекту',
     11, 2);

--- Выполнится с предупреждением ---
insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-01-12 19:29:52-00', '2023-02-09', money(150), 'Хорошо разбираюсь в теме, сделаю качественно',
     15, 2);

--- Выполнится без предупреждения ---
insert into application (date_time, deadline, price, description, freelancer_id, job_id) values
    ('2023-02-01 12:43:08-00', '2023-02-05', money(350), 'Хорошо разбираюсь в теме, сделаю качественно',
     15, 5);


