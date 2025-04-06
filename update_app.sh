#!/bin/bash
set -e

date
echo "Updating Python application on VM..."

APP_DIR="/home/azureuser/SDA-bootcamp-project"
GIT_REPO="https://${GITHUB_TOKEN}@github.com/nora1kh/SDA-bootcamp-project.git"
BRANCH="main"

# Update code
if [ -d "$APP_DIR" ]; then
    sudo -u azureuser bash -c "cd $APP_DIR && git pull origin $BRANCH"
else
    sudo -u azureuser git clone -b $BRANCH "$GIT_REPO" "$APP_DIR"
fi

 Install dependencies
sudo -u azureuser /home/azureuser/SDA-bootcamp-project/venv/bin/pip install --upgrade pip
sudo -u azureuser /home/azureuser/SDA-bootcamp-project/venv/bin/pip install -r "$APP_DIR/requirements.txt"

# Restart the service
sudo systemctl restart myapp

echo "Python application update completed!"
