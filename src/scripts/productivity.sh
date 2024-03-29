#!/bin/bash

# TODO: Install Office suite

# Install Spectacle & Taskwarrior
apps=("spectacle" "task")
for app in ${apps[@]}; do
	if [[ -d "usr/local/cellar/$app/" ]]; then
		echo "$app is already installed."
	else
		brew install "$app"
	fi
done

# Taskwarrior config
cat "$(pwd)/src/config-files/taskwarrior/taskrcUpdates.txt" >> ~/.taskrc

# Add directory for custom themes
if [[ -d "$HOME/.task/themes/" ]]; then
	echo "Taskwarrior themes directory already exists."
else
	mkdir ~/.task/themes/
fi

# TODO: Add custom themes to directory
# cp ./src/config-files/taskwarrior/themes/ ~/.task/themes/

# Install Simplenote and Todoist
caskApps=("simplenote" "todoist")
for caskApp in ${caskApps[@]}; do
	if [[ -d "/usr/local/Caskroom/$caskApp" ]]; then
		echo "$caskApp is already installed."
	else
		brew install --cask "$caskApp"
	fi
done
