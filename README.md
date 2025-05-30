# jmeter_practise
This project is responsible for testing for https://petstore.swagger.io/ endpoints.

To build env and  start performance tests once  run the command: 

sh start_script.sh

 to execute extra tests -  import jmeter config file jmeter-test-plan/jmeter_configs.jmx to jmeter and run it again 

### Homework: 

* Discovery of [performance-testing-framework](https://github.com/serputko/performance-testing-framework)
* Write simple Jmeter test plan for [user-api](https://petstore.swagger.io) Create, Update, Delete user
  * Add to your repository shell script (bat for Windows) to run your project without UI (GUI)
  * In jmeter test plan add user variables from script 
  * In jmeter test plan add Extract data from response
  * In jmeter test plan add CSV file processing to manage test data
  * Share your work in GitHub\GitLab\Bitbucket repository 
  * Provide a docker compose file with Grafana and influx db 
  * Setup jmeter dashboard in Grafana https://grafana.com/grafana/dashboards/4026-jmeter-dashboard/Links to an external site.
 
### Project structure: 

jmeter-practise/
├── docker-compose.yml
└── test-plan/
    ├── jmeter_configs.jmx         
    ├── jmeter_users_create.csv    
    ├── jmeter_users_update.csv    
    └── jmeter_users_delete.csv    
