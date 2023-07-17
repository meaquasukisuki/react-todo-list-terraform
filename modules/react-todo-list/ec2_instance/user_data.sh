#!/bin/bash
# redirect all error message below this line to /var/log/user_data_error.log 
exec 2>> /var/log/user_data_error.log  
sudo yum update -y
sudo yum install -y git docker
sudo service docker start
git clone https://github.com/meaquasukisuki/test-react-todo
cd ./test-react-todo
docker build -t frontend .
docker run --name todo -dp 8000:80 frontend