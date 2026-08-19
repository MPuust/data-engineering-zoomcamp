'''
select
	t.tpep_pickup_datetime,
	t.tpep_dropoff_datetime,
	t.total_amount,
	zpu."Borough" || ' / ' || zpu."Zone" AS "pick_up",
	dpo."Borough" || ' / ' || dpo."Zone" AS "drop_off"

from
	yellow_taxi_trips t,
	zones zpu, --pickup
	zones dpo --dropoff
WHERE
	t."PULocationID" = zpu."LocationID" and
	t."DOLocationID" = dpo."LocationID"
'''

Ilma joinita "inner join", saame ainult tulemused kus kirjed vastvad.