-- 9. Получить список фрилансеров, имеющих одинаковые специализации,
-- в описании которых присутствуют слова «облачн(ый|ых|ое)» и «сервис(ы|ов)».


select first_name || ' ' || last_name as full_name,
	   specialization, app.description
	from freelancer fr
	right join application app on app.freelancer_id = fr.id
		where (app.description similar to '%облачн(ый|ых|ое)%') and
			  (app.description similar to '%сервис(ы|ов|ах)%') ;




------------SOLUTION!!!-----------------

SELECT fr_1.first_name,
       fr_1.specialization,
       DENSE_RANK() OVER (ORDER BY fr_1.specialization) AS dense_rank,
       fr_2.spec_count,
       app.description

FROM freelancer AS fr_1
INNER JOIN
(
    SELECT specialization, COUNT(*) AS spec_count
    FROM freelancer
	RIGHT JOIN application AS app ON app.freelancer_id = freelancer.id
          WHERE (app.description SIMILAR TO '%облачн(ый|ых|ое)%') AND
			  	(app.description SIMILAR TO '%сервис(ы|ов|ах)%')
    GROUP BY specialization
) fr_2
ON fr_1.specialization = fr_2.specialization

    RIGHT JOIN application AS app ON app.freelancer_id = fr_1.id
	WHERE (app.description SIMILAR TO '%облачн(ый|ых|ое)%') AND
	      (app.description SIMILAR TO '%сервис(ы|ов|ах)%') AND
	      spec_count > 1

ORDER BY dense_rank;

-----------------------------------------