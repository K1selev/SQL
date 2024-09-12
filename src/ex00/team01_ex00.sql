SELECT distinct
       name,
       lastname,
       type,
       sum(money::numeric) AS volume,
       currency_name,
       last_rate_to_usd,
       (sum(money) * last_rate_to_usd) AS total_volume_in_usd
FROM (SELECT distinct
             COALESCE(u.name, 'not defined') AS name,
             COALESCE(u.lastname, 'not defined') AS lastname,
             b.type,
             b.money,
             COALESCE(c.name, 'not defined') AS currency_name,
             COALESCE(first_value(c.rate_to_usd) over(partition by c.id order by c.updated DESC), 1) AS last_rate_to_usd
        FROM balance b
            FULL JOIN "user" u
            ON b.user_id = u.id
         	FULL JOIN currency c
            ON b.currency_id = c.id
	) t1
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name DESC, lastname, type