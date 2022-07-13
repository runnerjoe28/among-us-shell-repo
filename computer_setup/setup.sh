##
##  PURPOSE:
##  Orchestrates operations to configure the computer to my liking, mainly for
##  installing a few libraries, tools, setting changes, etc.
##
##  Most of the functionality is split between different scripts for improved
##  clarity, specifics can be found in each file
##
##  USAGE:
##  Please run this file from within the Dotfiles/computer_setup directory as to
##  not mess up file paths. Run with the following command
##
##      source setup.sh
##

################################################################################


##  HELPER FUNCTIONS

##
##  Adds element to list of successful new installs (not yet implemented)
##      Arg1: string of element successfully installed
##


##
##  Adds element to list of successful old installs (not yet implemented)
##      Arg1: string of element already installed
##


################################################################################

##  SETUP IMPORTANT VARIABLES AND CONFIGURATIONS

# Ensures user (owner) and group can actually execute all the files
chmod 774 ./*

# Sets the permissions default
#   Owner: read, write, execute (directories only)
#   Group: read, write, execute (directories only)
#   Other: read, write, execute (directories only)
umask 002

# Create variable for seperator, nice to have for consistancy
SEPARATOR=''
SEP_SYMBOL='#'

# Create tracking variable for errors
ERRORS=""

# Create separator to span entire terminal
num_cols=`tput cols`
for (( i=1 ; i<=$num_cols ; i++ )); do SEPARATOR+="$SEP_SYMBOL"; done
export SEPARATOR

################################################################################


##  RUN CONFIGURATIONS TO ENABLE SUDO AND APT UPDATES

# Force a login to sudo, this will likely happen later on but it is nice to have
# a consistent login right at the begining, and then display success message
sudo echo -e "SUDO login successful, beginning installations"
echo -e "$SEPARATOR\n"

# Run apt-get commands here for ease of use in later installs
# Don't suppress outputs so user input is easy
sudo apt-get update
sudo apt-get upgrade
echo -e "$SEPARATOR\n"

################################################################################


##  INSTALL ELEMENTS

# Install python and related libraries and tools (and update trackers)
source python_setup.sh || (echo "Python downloads failed" ; ERRORS+="PYTHON\n")

# Install docker and docker compose plus configure settings (and update trackers)
source docker_setup.sh || (echo "Docker downloads failed" ; ERRORS+="DOCKER\n")

# Install other tools (and update trackers)
source other_setup.sh || (echo "Other downloads failed" ; ERRORS+="OTHER\n")

################################################################################


##  WRAP UP AND REPORT STATUS

# Error message
[ -z "$ERRORS" ] || (echo -e "The following sections experienced errors\n$ERRORS\n" ; cat ./static_messages/install_errors_message.txt)

# Unset variables
unset SEPARATOR, SEP_SYMBOL, ERRORS