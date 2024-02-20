#!/usr/bin/env bash
set -e

# Set up logging
LOG_FILE="$HOME/AnsibleSetup.log"
exec > >(tee -i "$LOG_FILE")
exec 2>&1

# Define script variables
PLAYBOOK_FILE="/home/pavlak/dotfiles/Ansible/dotfiles.yml"

# Check if Ansible is installed, if not, install it
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install -y ansible
fi

# Run Ansible playbook with sudo privileges
ansible-playbook $PLAYBOOK_FILE --ask-become-pass
echo "Setup completed successfully. Log file: $LOG_FILE"

exit 0