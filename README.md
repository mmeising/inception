# inception

This is my take on the project inception from the 42 curriculum.
It teaches the use of docker, docker-compose and how containers work.

We have to set up a docker network consisting of:

- a container with nginx only, reachable through port 443
- a container with wordpress and php, communicating with the first container only through port 9000
- a container with mariadb, communicating with the wordpress container through port 3306

- a volume for the database of mariadb
- a volume for the wordpress data

The project has to follow a specific directory structure.


# Getting started

The project is supposed to be done in a virtual machine because we need to be able to edit the /etc/hosts file to make our website accessible through https://intra_login_here.42.fr.</br>
So first, I got the current stable version of Lubuntu to install via VirtualBoxVM.</br>
In the installation process, I chose my intra login (mmeising) as my user profile. If you choose anything else, change every use of "mmeising" in the whole repository to your intra name or whatever you choose to use.</br></br>
Important: in the VirtualBox settings of your VM, go to `Network` and switch the `Attached to:` option to `Bridged Adapter`.</br>
This is done to be able to connect to your VM via ssh from your host machine.</br>
To get from this fresh install to a working inception project, follow these steps:

`sudo apt-get update && sudo apt-get install build-esssential -y`</br>

Next, you can git clone this repo and cd into it.</br>

`make prep`</br>
`make ssh`</br>
You should see your ssh service up and running.</br>
`make ip`</br>
This will show you multiple IP addresses, one of which is the one you can use to connect to your VM via ssh.</br>
You will know the right one by excluding the IP addresses starting with 192, 172 or 127.</br>
On your host machine, install the following VSCode extensions:</br>
- `Remote - SSH`
- `Remote - SSH: Editing config files`
- `Remote Explorer`</br>

Now you can connect to your VM:</br>
In VSCode, press F1 and run `Remote - SSH: Add new SSH Host`.</br>
Enter `ssh username_you_chose@ip_from_before -p 22` (standard port is 22 if you didn't change the settings), choose to save in `users/username/.ssh/config`.</br>
Press F1 again, run `Remote - SSH: connect to host` and choose the connection you just created.</br>
If you now also open your directory in the explorer of VSCode, you can do everything you need to do from the comfort of your host machine!</br>

`make docker` explains how to install docker on your VM.</br>
Now you have to fill in the blanks of the ./srcs/.env file with credentials of your choice.</br>

That's it, you should be able to run `make` or `make all` now to build the containers and run them.</br>
Afterwards, you can open the page in your VM via https://username_you_chose.42.fr.</br>
`make clean` will clean form all the docker containers, images and volumes.</br>
`make del_vol` will additionally clear the local volumes that are loaded into the containers.</br>
