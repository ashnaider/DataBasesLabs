-- 7.  Получить информацию об объявлениях, для которых дедлайн, установленный заказчиком,
-- наступает позже, чем дедлайн, установленный фрилансером.


select app.id, nj.deadline as customer_deadline,
       app.deadline as freelancer_deadline,
       nj.price as customer_price,
       app.price as freelancer_price,
       app.description
from application as app
left join new_job as nj on nj.id = app.job_id
where app.deadline < nj.deadline;