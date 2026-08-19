### Question 1
docker run -it --entrypoint=bash python:3.13
pip --version

Output:
pip 26.2.1 from /usr/local/lib/python3.13/site-packages/pip (python 3.13)

### Question 2

docker compose up
They are in the same internal network so hostname is the service name "postgres" and external port is 5432. 

### Question 3
green_taxi_df = pd.read_parquet("https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2025-11.parquet")
zones_df = pd.read_csv("https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv")
pgs = create_engine("postgresql+psycopg2://postgres:postgres@localhost:5433/ny_taxi")

'''
select *
from green_taxi_trips gt
where gt.lpep_pickup_datetime::date >= '2025-11-01'::date
and gt.lpep_pickup_datetime::date < '2025-12-01'::date
and gt.trip_distance <= 1.0
'''

Answer: 8007

### Question 4

"""
select gt.lpep_pickup_datetime::date, MAX(trip_distance)

from green_taxi_trips gt
where gt.trip_distance <= 100

group by 1 order by 2 desc
"""

Answer: 2025-11-14

### Question 5
"""
select z."LocationID", z."Zone", count(gt)
from green_taxi_trips gt
join zones z on gt."PULocationID" = z."LocationID"
group by 1,2
order by 3 desc
"""

Answer:East Harlem North

### Question 6

"""
select dz."Zone", max(gt.tip_amount)

from green_taxi_trips gt
join zones pz on gt."PULocationID" = pz."LocationID"
join zones dz on gt."DOLocationID" = dz."LocationID"

where pz."Zone" = 'East Harlem North'

and DATE_TRUNC('month',gt.lpep_pickup_datetime::date) = '2025-11-01'
group by 1
order by 2 desc
"""

Answer: Yorkville West

### Question 7

Answer: terraform init, terraform apply -auto-approve, terraform destroy




