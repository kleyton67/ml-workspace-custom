#!/bin/sh

# Stops script execution if a command has an error
set -eax

INSTALL_ONLY=0
# Loop through arguments and process them: https://pretzelhands.com/posts/command-line-flags
for arg in "$@"; do
    case $arg in
        -i|--install) INSTALL_ONLY=1 ; shift ;;
        *) break ;;
    esac
done

if [ ! -f "/usr/share/code/code" ]; then
    echo "Installing VS Code. Please wait..."
    cd $RESOURCES_PATH
    # Tmp fix to run vs code without no-sandbox: https://github.com/microsoft/vscode/issues/126027
    wget -q https://vscode.download.prss.microsoft.com/dbazure/download/stable/0f0d87fa9e96c856c5212fc86db137ac0d783365/code_1.104.1-1758154125_amd64.deb -O ./vscode.deb
    # wget -q https://go.microsoft.com/fwlink/?LinkID=760868 -O ./vscode.deb
    apt-get update
    apt-get install -y ./vscode.deb
    rm -rf ./vscode.deb
    rm -rf /etc/apt/sources.list.d/vscode.list
else
    echo "VS Code is already installed"
fi

# Run
if [ $INSTALL_ONLY = 0 ] ; then
    echo "Starting VS Code"
    /usr/share/code/code --no-sandbox --unity-launch $WORKSPACE_HOME
    sleep 10
fi
