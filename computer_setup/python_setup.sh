##  Downloads a set of important python related tools

################################################################################


# Display message indicating the python related installs are beginning
# Also give overview of installs
cat ./static_messages/python_overview.txt
echo -e "\n$SEPARATOR\n"
echo -e "BEGINNING PYTHON INSTALLATIONS NOW\n"

################################################################################


##  Download the tools. The pip schema is interesting, so it is explained here:
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


# Install pip
(pip3 --version &> /dev/null && echo -e "pip is already installed, skipping") || sudo apt install python3-pip

# Upgrade pip (may resolve errors with library installations)
pip install --upgrade pip &> /dev/null

# Install pip libraries
for lib in {tensorflow,matplotlib,spektral}; do
	pip_result=`pip list | grep -F $lib`
    ([ -z "$pip_result" ] && pip install $lib) || echo "$lib is already installed, skipping"
done;
unset lib;

# Add a spacer
echo -e "\n$SEPARATOR\n"