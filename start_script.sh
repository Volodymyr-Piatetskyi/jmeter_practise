set -e 
echo "Starting Docker Compose persistent services (InfluxDB and Grafana) in detached mode..."
docker-compose up -d influxdb grafana

echo "Waiting for Grafana to become ready..."
until curl -s http://localhost:3000/api/health | grep -q -E '"database":[[:space:]]*"ok"'; do
    sleep 5
    echo "Still waiting for Grafana..."
done
echo "Grafana is up and running."
echo "Configuring InfluxDB in Grafana..."
curl -X POST -H "Content-Type: application/json" -u admin:admin \
  -d '{
        "name": "InfluxDB",
        "type": "influxdb",
        "access": "proxy",
        "url": "http://localhost:8086",
        "database": "mydb",
        "user": "admin",
        "password": "adminpassword",
        "isDefault": true
      }' \
  http://localhost:3000/api/datasources

echo "InfluxDB data source configured successfully!"
echo "Importing JMeter Dashboard into Grafana..."
curl -X POST -H "Content-Type: application/json" -u admin:admin \
  -d '{
        "dashboard": '"$(cat jmeter-dashboard.json)"',
        "overwrite": true,
        "folderId": 0
      }' \
  http://localhost:3000/api/dashboards/db

echo "JMeter Dashboard imported successfully!"

echo "Starting JMeter test execution..."
docker-compose run --rm jmeter

echo "JMeter test completed!"
