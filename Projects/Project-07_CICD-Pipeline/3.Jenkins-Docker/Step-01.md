
### Instructions:

1. **Create a file named docker-compose.yml**
   - First, you need to crete a docker-compose file named docker-compose.yml in your preferred directory.
   - You can also clone with `git clone` [dockerfiles](./docker-compose.yml)l to download docker packages directly to the command line.

```yaml
version: '3'

services:
  sonarqube_db:
    image: postgres
    environment:
      POSTGRES_USER: sonar
      POSTGRES_PASSWORD: sonar
      POSTGRES_DB: sonarqube
    networks:
      - sonarnet
    volumes:
      - sonarqube_db_data:/var/lib/postgresql/data

  sonarqube:
    image: sonarqube
    depends_on:
      - sonarqube_db
    environment:
      SONAR_JDBC_URL: jdbc:postgresql://sonarqube_db:5432/sonarqube
      SONAR_JDBC_USERNAME: sonar
      SONAR_JDBC_PASSWORD: sonar
    networks:
      - sonarnet
    ports:
      - "9000:9000"
    volumes:
      - sonarqube_data:/opt/sonarqube/data

  nexus:
    image: sonatype/nexus3
    ports:
      - "8081:8081"
    volumes:
      - nexus_data:/nexus-data

  tomcat:
    image: tomcat:9.0
    ports:
      - "8888:8080"
    volumes:
      - tomcat_webapps:/usr/local/tomcat/webapps

networks:
  sonarnet:

volumes:
  sonarqube_db_data:
  sonarqube_data:
  nexus_data:
  tomcat_webapps:
```

2. **Start the services**: Open a terminal, navigate to the directory where your `docker-compose.yml` file is located, and run the following command to start all services:
   ```sh
   docker-compose up -d
   ```
   This command will download the necessary Docker images, create the defined networks and volumes, and start the services in detached mode.

3. **Access the applications**:
   - **SonarQube**: Accessible at `http://localhost:9000`. The first time you access it, you may need to configure it and set up an admin account.
   - **Nexus Repository Manager**: Accessible at `http://localhost:8081`. Upon first access, you will be prompted to set up an admin account.
   - **Tomcat**: Accessible at `http://localhost:8888`. You can deploy web applications by placing them in the `tomcat_webapps` volume directory.

4. **Shutdown and cleanup**: To stop and remove the containers, networks, and volumes defined by your `docker-compose.yml`, you can run:
   ```sh
   docker-compose down -v
   ```

### Notes:

- This setup is intended for development or testing environments. For production use, you should consider additional security configurations, such as setting secure passwords through environment variables or secrets management solutions.
- The volumes defined in the `docker-compose.yml` ensure that your data is persisted across container restarts. If you remove these volumes (`docker-compose down -v`), all your data will be lost.
- Make sure to review and comply with the licensing and usage policies of the software you are using.