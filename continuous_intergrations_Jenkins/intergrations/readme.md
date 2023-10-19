![diagram-export-19-10-2023-15_26_56](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/ae81cca1-8040-499e-a37b-a22eec082ee3)

# Deploying the UnitedCore-Bootcamp on Tomcat with SonarQube and Nexus using Jenkins CI/CD

- We will be using Jenkins as a CICD tool and deploying our bootcamp web application to Tomcat web server. 

```sh
GitHub Repo https://github.com/unitedcoresystems/maven-web-application.git
```

### Steps:-

#### Step 1 — Launch an ec2 instances to install the following 
            
- EC2 installation : https://github.com/unitedcoresystems/Bootcampclass-2023/tree/dev/Package_management/EC2_Instances


#### Step 2 — Configure Jenkins, Tomcat, Nexus and sonaqube. 

1. Jenkins ---> https://github.com/unitedcoresystems/Bootcampclass-2023/tree/dev/Package_management/Jenkins_installation
            
2. Tomcat ---> https://github.com/unitedcoresystems/Bootcampclass-2023/tree/dev/Package_management/Tomcat_installation

3. Sonarqube ---> https://github.com/unitedcoresystems/Bootcampclass-2023/blob/dev/Package_management/SonarQube_installation/README.md

4. Nexus ---> https://github.com/unitedcoresystems/Bootcampclass-2023/blob/dev/Package_management/Nexus_installation/README.md

#### Step 3 — Install Tools and Plugins like maven and 'Deploy to container ear/war'.

##### Tools (Maven) 
   - Manage jenkins --> Tools --> Add Maven 

##### Plugin (Deploy to container ear/war)
   - Manage jenkins --> Plugins 
   - Select Avalible plugins and type "Deploy to container" in the searh bar
   - Click install without restart jenkins 

#### Step 4 — Create a Project in Jenkins using one of the following 

    - Declarative Pipeline -->
    - Scripted pipeline --> 
    - Freestyle --> 

#### Step 5 — Access the application on the Browser with Tomcat server url.

- http://public-ip-address:8080

#### Step 6 — Terminate the AWS EC2 Instances.