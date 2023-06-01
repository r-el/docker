#!/bin/bash

# Check if docker is installed
if ! command -v docker &> /dev/null
then
    read -p "Docker is not installed. Do you want to install Docker? (y/n): " choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        # Update repository information
        sudo apt-get update -y

        # Ensure that HTTPS transport is available to APT
        sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

        # Add Docker's GPG key
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

        # Verify the fingerprint
        sudo apt-key fingerprint 0EBFCD88

        # Add Docker repository
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

        # Update repository information (again)
        sudo apt-get update -y

        # Install Docker
        sudo apt-get install docker-ce -y

        echo "Docker installed successfully."
    else
        echo "Docker is not installed. Exiting..."
        exit 1
    fi
fi

# Ask for the name of container
read -p "Enter the name of the container: " container_name
echo



# Check if a container with the same name already exists
if [ "$(docker ps -a -q -f name=$container_name)" ]; then
    # If it does, ask the user whether they want to remove the existing container
    read -p "A container with the name '$container_name' already exists. Do you want to remove it? (y/n): " choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        # Check if the existing container is running
        if [ "$(docker ps -q -f name=$container_name)" ]; then
            echo "Stopping the running container..."
            docker stop $container_name
        fi

        # Remove the existing container
        echo "Removing the existing container..."
        docker rm $container_name
    else
        echo "Cannot create a new container with the name '$container_name' because a container with the same name already exists. Exiting..."
        exit 1
    fi
fi

# Ask for the MySQL root password
read -sp "Enter the MySQL root password: " mysql_root_password
echo

# Create a MySQL Docker container
docker run --name $container_name -e MYSQL_ROOT_PASSWORD=$mysql_root_password -d mysql

if [ $? -eq 0 ]; then
    echo "MySQL Docker container created successfully."
else
    echo "Failed to create MySQL Docker container. Exiting..."
    exit 1
fi

