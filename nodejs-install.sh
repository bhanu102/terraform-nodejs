#!/bin/bash
sudo apt update
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo mkdir /nodejs
sudo cp /tmp/Dockerfile /nodejs/Dockerfile
sudo cp /tmp/app.js /nodejs/app.js
cd /nodejs/
sudo npm init -y
sudo npm install express
sudo rm -rf node_modules
sudo docker build -t examplenode .
sudo npm install
sudo docker run -d -p 80:3000 --name node-app examplenode