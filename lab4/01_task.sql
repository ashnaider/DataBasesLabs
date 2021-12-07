-- ЛР № 4 (подзапросы, представления и аналитические функции)
--
-- 1. Получить (в одном запросе) список заказчиков
-- с указанием их рейтинга (места) при ранжировании по количеству объявлений,
-- количеству жалоб и количеству успешно выполненных работ.


select
       cust.first_name || ' ' || cust.last_name as full_name,
       cust.id as customer_id,
       substring(cust.organisation_name, 0, 30) as org_name,

       dense_rank() over (order by
                  case
                    when new_jobs_counts is null
                        then 0
                    else new_jobs_counts
                  end
           desc) as jobs_count_pos,


       case
           when new_jobs_counts is null
		   		then 0
           else new_jobs_counts
       end as jobs_count_full,


       dense_rank() over (order by
                  case
                    when jobs_done is null
                        then 0
                    else jobs_done
                  end
           desc) as jobs_done_pos,

       case
           when jobs_done is null
		   		then 0
           else jobs_done
       end as jobs_done_full,


       dense_rank() over (order by
                  case
                    when complaints_count is null
                        then 0
                    else complaints_count
                  end
           desc) as complaints_pos,

       case
           when complaints_count is null
               then 0
           else complaints_count
      end as complaints_count_full,


       dense_rank() over (order by
                  case
                    when new_jobs_counts is null
                        then 0
                    else new_jobs_counts
                  end
           desc,

           case
                    when jobs_done is null
                        then 0
                    else jobs_done
                  end
           desc,

           case
                    when complaints_count is null
                        then 0
                    else complaints_count
                  end
           desc) as total_pos


from customer as cust


left join (
    select count(*) as new_jobs_counts, new_job.customer_id
    from new_job
    group by new_job.customer_id
) as jobs_count on jobs_count.customer_id = cust.id

left join (
    select count(customer_id) as jobs_done, customer.id as cust_id
    from project_done
    inner join new_job on project_done.job_id = new_job.id
    inner join customer on customer.id = new_job.customer_id
    group by customer.id
) as projects_done on projects_done.cust_id = cust.id

left join (
    select count(customer.id) as complaints_count, customer.id as cust_id
    from user_complaint
    inner join customer on customer.id = user_complaint.customer_id
    where user_complaint.is_from_customer = true
    group by customer.id
) as complaints_counts on complaints_counts.cust_id = cust.id

order by total_pos
;














select
       cust.first_name || ' ' || cust.last_name as full_name,
       cust.id as customer_id,

       substring(cust.organisation_name, 0, 30) as org_name,

       dense_rank() over (order by new_jobs_counts desc) as jobs_count_pos,

       case
           when new_jobs_counts is null
		   		then 0
           else new_jobs_counts
       end as new_jobs_count_full,

       case
           when jobs_done is null
		   		then 0
           else jobs_done
       end as jobs_done_full,

       case
           when complaints_count is null
               then 0
           else complaints_count
      end as complaints_count_full


from customer as cust

-- TODO: make left join and check, if all right
left join (
    select count(*) as new_jobs_counts, new_job.customer_id
    from new_job
    group by new_job.customer_id
) as jobs_count on jobs_count.customer_id = cust.id

left join (
    select count(customer_id) as jobs_done, customer.id as cust_id
    from project_done
    inner join new_job on project_done.job_id = new_job.id
    inner join customer on customer.id = new_job.customer_id
    group by customer.id
) as projects_done on projects_done.cust_id = cust.id

left join (
    select count(customer.id) as complaints_count, customer.id as cust_id
    from user_complaint
    inner join customer on customer.id = user_complaint.customer_id
    where user_complaint.is_from_customer = true
    group by customer.id
) as complaints_counts on complaints_counts.cust_id = cust.id

order by new_jobs_count_full DESC;