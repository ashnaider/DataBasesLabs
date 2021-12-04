--
-- 3. Получить информацию о фрилансерах (расположив их имена в алфавитном порядке),
-- которые владеют двумя указанными (по усмотрению студента) технологиями и успешно выполнили от 3 до 10 работ.


select
fr.id,
fr.first_name || ' ' || fr.last_name as full_name,
fr.specialization,
fr.email,
tech.tech_name as first_tech,
tech_2.tech_name as second_tech

from freelancer as fr

inner join technology_stack as t_st_l on fr.id = t_st_l.freelancer_id

inner join technology_stack as t_st_r on fr.id = t_st_r.freelancer_id

inner join technology as tech on t_st_l.technology_id = tech.id

inner join technology as tech_2 on t_st_r.technology_id = tech_2.id

inner join project_done as pd on fr.id = pd.freelancer_id

where tech.tech_name = 'HTML' and tech_2.tech_name = 'CSS'

group by (  fr.id,
		    fr.first_name || ' ' || fr.last_name,
			fr.specialization,
		  	fr.email,
			tech.tech_name,
			tech_2.tech_name)

having (count(pd.id) >= 3)
order by full_name
;



--
-- 3. Получить информацию о фрилансерах (расположив их имена в алфавитном порядке),
-- которые владеют двумя указанными (по усмотрению студента) технологиями и успешно выполнили от 3 до 10 работ.


select distinct
    fr.first_name || ' ' || fr.last_name as full_name,
    fr.id,
    fr.email,
    fr.specialization,
    job_done
    ,
    tech_t_first.t_name,
    tech_t_second.t_name
from freelancer as fr
right join
(
        select count(*) as job_done, freelancer_id
        from project_done
        group by project_done.freelancer_id
        having count(freelancer_id) between 3 and 10
) as jobs_done on freelancer_id = fr.id

inner join
(
    select freelancer_id as fr_id, tech.tech_name as t_name from technology_stack as t_st
    left join technology as tech on tech.id = t_st.technology_id
    where tech.tech_name = 'HTML'
) as tech_t_first on tech_t_first.fr_id = fr.id

inner join
(
    select freelancer_id as fr_id, tech.tech_name as t_name from technology_stack as t_st
    left join technology as tech on tech.id = t_st.technology_id
    where tech.tech_name = 'CSS'
) as tech_t_second on tech_t_second.fr_id = fr.id
order by full_name
;





