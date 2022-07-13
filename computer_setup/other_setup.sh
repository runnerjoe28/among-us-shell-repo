##  Downloads a set of important python related tools

################################################################################


# Display message indicating the python related installs are beginning
# Also give overview of installs
cat ./static_messages/other_overview.txt
echo -e "\n$SEPARATOR\n"
echo -e "BEGINNING OTHER INSTALLATIONS NOW\n"

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
##
##  This schema is not yet in place here, but is pasted for future reference


# Install neofetch
sudo apt install neofetch # Simple install

# Install powerline
sudo apt install fonts-powerline # Simple install

# Add a spacer
echo -e "\n$SEPARATOR\n"
