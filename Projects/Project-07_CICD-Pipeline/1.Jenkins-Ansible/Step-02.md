# Integrating GitHub with Jenkins via webhooks 

### Step 1: Configure GitHub Webhook
1. **Go to your GitHub repository**: Navigate to the repository you want to integrate with Jenkins.

2. **Access repository settings**: Click on 'Settings' on the right side of the repository page.

3. **Webhooks**: In the settings menu, click on 'Webhooks' then 'Add webhook'.

4. **Webhook URL**: 
   - You will need to provide the Payload URL which is the Jenkins URL followed by `/github-webhook/`. It should look something like this:
     ```
     http://<jenkins-url>/github-webhook/
     ```
   - Replace `<jenkins-url>` with the actual domain name or IP address of your Jenkins server.

5. **Content type**: Select 'application/json' for the content type.

6. **Which events would you like to trigger this webhook?**: Select 'Just the push event.' or choose 'Send me everything.', depending on your requirements.

7. **Active**: Ensure the webhook is set to active.

8. **Add webhook**: Click on 'Add webhook' to save your settings.

### Step 2: Create a New Job in Jenkins
1. **Access Jenkins**: Open a web browser and go to your Jenkins dashboard.

2. **New Item**: Click on 'New Item' at the top left of the Jenkins home page.

3. **Enter a name for your job**: Provide a name for your new job and select 'Freestyle project'. Click 'OK'.

4. **Configure Source Code Management**:
   - In the job configuration, scroll down to the 'Source Code Management' section.
   - Select 'Git' and enter the repository URL.
   - Add the credentials if the repository is private.

5. **Configure Build Triggers**:
   - Scroll down to the 'Build Triggers' section.
   - Select 'GitHub hook trigger for GITScm polling'.

6. **Configure the Build**:
   - In the 'Build' section, add the build steps required for your project, such as compiling the code or executing scripts.

7. **Save the Job**: Click 'Save' to finish creating the job.

### Step 3: Test the Integration
1. **Make a commit to GitHub**: Push a new commit to your GitHub repository.

2. **Check Jenkins**: After the commit, Jenkins should automatically trigger a new build for the job you created.

3. **Verify the build**: Once the build is complete, check the build status and logs to ensure everything works as expected.

By following these steps, you have integrated GitHub with Jenkins using webhooks, which allows Jenkins to automatically run builds upon new code commits.