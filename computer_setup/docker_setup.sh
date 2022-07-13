##  Downloads a set of important docker related tools

################################################################################


# Display message indicating the docker related installs are beginning
# Also give overview of installs
cat ./static_messages/docker_overview.txt
echo -e "\n$SEPARATOR\n"
echo -e "BEGINNING DOCKER INSTALLATIONS NOW\n"

################################################################################


##  Helper functions

##
##  Seperate function for installing docker-compose
##
install_docker_compose() {
    latest_version=`curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | grep -o 'v[+[:digit:]].[+[:digit:]].[+[:digit:]]'`
    sudo curl -L "https://github.com/docker/compose/releases/download/${latest_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
}

################################################################################


##  Download the tools. The schema is interesting, so it is explained here:
##
##      (<version_command> &> /dev/null && echo "<already_installed>") || <install_command>
##
##  Descript of variables and terms
##      * version_command - check version of tool
##      * /dev/null - directory for directing unwanted output
##      * already_installed - message indicating tool is already installed
##      * install_command - command to install tool
##
##  The version_command is run and output is redirected to /dev/null via "&>" so
##  it does not appear in the terminal. "&&" means run the next command ONLY IF
##  the previous command was successful (aka the tool is already installed).
##  Likewise, the "||" means run the next command ONLY IF the previous command
##  failed, which will happen if the tool is NOT installed.

# Install docker
(docker --version &> /dev/null && echo "docker is already installed, skipping") || sudo apt install docker.io

# Install curl
(curl --version &> /dev/null && echo "curl is already installed, skipping") || sudo apt install curl

# Install docker-compose (uses stupid method to get version, then installs)
(docker-compose --version &> /dev/null && echo "docker-compose is already installed, skipping") || install_docker_compose

# Add user to docker group to enable use of docker (and compose) commands without sudo 
# (almost always requires a restart to take effect)
docker_group='groups $USER | grep docker'
([ -z "$docker_group" ] && sudo gpasswd -a $USER docker) || echo "$USER is already added to docker group, skipping"

# Add a spacer
echo -e "\n$SEPARATOR\n"