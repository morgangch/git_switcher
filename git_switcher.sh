#!/bin/bash

# Script pour changer de compte Git
# Usage: git_switcher.sh <nom_du_compte>
set -o allexport
source .switcher.env
set +o allexport


# Fonction pour demander à l'utilisateur de saisir une valeur
function prompt_user {
    local message=$1
    local input

    read -p "$message: " input
    echo $input
}

if [ "$account1" == "" ] || [ "$account2" == "" ]; then
    echo "Let's define together the accounts you want to switch between."
    lang=$(prompt_user "Please enter the language you want to use (en or fr):")
    account1=$(prompt_user "Please enter the first account name:")
    account1_mail=$(prompt_user "Please enter the first account email:")
    account1_ssh=$(prompt_user "Please enter the first account SSH key path:")
    account2=$(prompt_user "Please enter the second account name:")
    account2_mail=$(prompt_user "Please enter the second account email:")
    account2_ssh=$(prompt_user "Please enter the second account SSH key path:")
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
