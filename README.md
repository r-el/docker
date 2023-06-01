# MySQL Docker Container Script

This script facilitates the process of installing Docker (if it's not already installed), and creating a MySQL Docker container on your system. You have the option to specify the name of the container and MySQL root password.

## Getting Started

### Prerequisites

- Ensure you have administrative access to your machine.
- An active internet connection is required to download Docker and MySQL images.

### Usage

Follow these steps to get started with the `mysqlDockerContainer.sh` script:

1. **Download the Script:**

    Use `curl` to download the `mysqlDockerContainer.sh` script:

    ```bash
    curl -o mysqlDockerContainer.sh https://raw.githubusercontent.com/r-el/docker/master/mysqlDockerContainer.sh
    ```

2. **Grant Execute Permissions:**

    The downloaded script should be granted execution permissions. This can be done with the following command:

    ```bash
    chmod +x mysqlDockerContainer.sh
    ```

3. **Run the Script:**

    You're now ready to run the script. As the script performs administrative tasks, it should be run with `sudo`:

    ```bash
    sudo ./mysqlDockerContainer.sh
    ```

    The script will guide you through the necessary steps to install Docker (if it's not already installed) and to create a MySQL Docker container.

**Note:** The script will require your input for some steps, such as confirming Docker installation and providing a MySQL root password. Please read the prompts carefully and respond accordingly.
