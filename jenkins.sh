#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting installation on Amazon Linux..."

#########################
# Update the system
#########################
echo "Updating system packages..."
sudo yum update -y

#########################
# 1. Install Git
#########################
echo "Installing Git..."
sudo yum install -y git

#########################
# 3. Install Jenkins
#########################
echo "Installing Jenkins..."

# Install Java (Jenkins dependency)
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17
sudo yum install jenkins

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

#########################
# Done
#########################
echo ""
echo "✅ Installation complete!"
echo "➡ Docker and Jenkins are installed and running."
echo "➡ Jenkins is available on port 8080."
echo "➡ You may need to logout/login for Docker group membership to apply."
echo ""

# Display initial Jenkins admin password
echo "🔑 Initial Jenkins admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

