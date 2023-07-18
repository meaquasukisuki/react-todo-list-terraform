#!/bin/bash
# redirect all error message below this line to /var/log/user_data_error.log 
exec 2>> /var/log/user_data_error.log  
echo -e ' \n start script' >> /var/log/user_data_error.log 
sudo yum update -y
sudo yum update -y
# install git and docker
sudo yum install -y git docker
sudo service docker start
echo -e 'docker version: ' >> /var/log/user_data_error.log 
sudo docker --version >> /var/log/user_data_error.log 

# jenkins
sudo docker pull jenkins/jenkins
sudo docker run --name jenkins_container -dp 8080:8080 jenkins/jenkins

echo -e " \n end script "  >> /var/log/user_data_error.log 
