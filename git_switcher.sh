#!/bin/bash

# Script pour changer de compte Git
# Usage: git_switcher.sh <nom_du_compte>
set -o allexport
source ./.switcher.env
set +o allexport

if [ "$account1" == "" ] || [ "$account2" == "" ]; then
    echo "Let's define together the accounts you want to switch between."
    echo "Please enter the first account name:"
    read account1
    echo "Please enter the first account email:"
    read account1_mail
    echo "Please enter the first account ssh key absolute path:"
    read account1_ssh
    echo "Please enter the second account name:"
    read account2
    echo "Please enter the second account email:"
    read account2_mail
    echo "Please enter the second account ssh key absolute path:"
    read account2_ssh
    echo "account1=$account1" > .switcher.env
    echo "account1_mail=$account1_mail" >> .switcher.env
    echo "account1_ssh=$account1_ssh" >> .switcher.env
    echo "\n" >> .switcher.env
    echo "account2=$account2" >> .switcher.env
    echo "account2_mail=$account2_mail" >> .switcher.env
    echo "account2_ssh=$account2_ssh" >> .switcher.env
    echo "Accounts have been successfully defined."
    echo "Please run the script again to switch between the accounts."
    exit 1
fi

if [ "$1" == $account1 ]; then
    git config --global --unset-all user.name
    git config --global --unset-all user.email
    git config --global user.name $account1
    git config --global user.email $account1_mail
    ssh-add -D
    ssh-add $account1_ssh
    echo "Changement de compte Git effectué avec succès. Vous êtes maintenant connecté avec le compte $account1."
elif [ "$1" == $account2 ]; then
    git config --global --unset-all user.name
    git config --global --unset-all user.email
    git config --global user.name $account2
    git config --global user.email $account2_mail
    ssh-add -D
    ssh-add $account2_ssh
    echo "Changement de compte Git effectué avec succès. Vous êtes maintenant connecté avec le compte $account2."
else
    echo "Erreur : Argument non valide. Veuillez spécifier '$account1' ou '$account2' comme argument."
fi
