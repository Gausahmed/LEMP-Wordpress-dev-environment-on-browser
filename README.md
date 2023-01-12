# Bash Script for creating LEMP Wordpress Site

This repository contains a Bash shell script which is capable of performing following tasks,
1. Check if Docker and Docker-compose is installed in your machine or not. If not installed, install it.
2. Create required files (eg. Docker-compose.yml, nginx/default.conf, publuc/index.php, etc)
3. Create a WordPress site using the latest WordPress Version. This will be a LEMP (Linux, Nginx, Mysql, PHP) stck running inside Docker containers.
4. Create a /etc/hosts entry for 'site_name' pointing to localhost.
5. perform subcommands to, stopping/starting, deleting containers.

## Execution Process

You only need to clone or copy this repository to your local folder and make sure the script.sh is executable in wordpress folder. You can do this by following command,

```Bash
chmod +x script.sh
```

After making the script executable, we can run the script for the above operations to perform using following command,

> It is MANDATORY to run the script as a administrator or superuser

```Bash
sudo ./script.sh SITE_NAME
```
> Note: Here you have to provide site name as an argument.

By running the scipt, it will perform the above mentioned task. It creates 5 different docker containers running LEMP stack (with phpmyadmin).
If everything goes well, you can visit your wordpress site by opening it in the browser using either site_name or [Localhost](http://127.0.0.1:8000) .

### Running Subcommands

There are some sub-commands available in the script to perform operations like stopping, starting/restarting, deleting the containers.
To run the sub-commands you need to add it to the main command as an argument for example,

1. To start/Restart the containers,

```Bash
./script.sh SITE_NAME enable
```
2. To Stop the containers,

```Bash
./script.sh SITE_NAME disable
```
3. To Delete the containers,

```Bash
./script.sh SITE_NAME delete
```

### Installing Wordpress at localhost

After opening the site in a browser, you can see the wordpress installation page with a form requiring your information and login credentials.
Fill the form and create the credentials and note them down for further use. Click on Install wordpress button at bottom.
Login with your credentials and you are ready with your wordpress site.

### Error handling

The script is already written so that there will be no room for error while execution but, we can't guarentee that the error will not occur.
Incase any error occurs, you can look at the logs of all the containers and get rid of the error ofcourse manually by running,

```Bash
docker-compose logs CONTAINER_NAME
```
There are more chances that the error can occure due to the ports on which we are running our stack are already in use. Although I have added a command in the script that makes the required ports free, but there can be some services which can restart at the same port. 
To avoid this error, check for the services running on the following ports 8000, 8080, 9000, 3306, 8081. If you found any service on one of these ports please try to stop them or you can change the script according to your required ports.

## Conclusion & Results

With the above bash script we can create a sample wordpress site running inside Docker containers. the script itself creates the required files and folders like docker-compose.yml, nginx config files, etc.
