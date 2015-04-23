import time,json,jutils,os
from influxdb.influxdb08 import InfluxDBClient

host = os.getenv('INFLUXDB_HOST', 'localhost')
dbname = os.getenv('INFLUXDB_DB', 'db1')
print(host)
# waiting for influxdb
time.sleep(10)

client = InfluxDBClient(host, 8086, 'root', 'root', dbname)
json_body = [
  {
    "name" : "log_lines",
    "columns" : ["line"],
    "points" : [
      ["here's log xx " + jutils.getDateTimeNowTag()]
    ]
  }
]
client.write_points(json_body)
print(client.get_list_database())
print(client.get_list_series())
r = client.query('select * from log_lines;')
print(jutils.jdump(r))
