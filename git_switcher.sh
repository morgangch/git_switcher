#!/bin/bash

# Script pour changer de compte Git
# Usage: git_switcher.sh <nom_du_compte>
set -o allexport
source .switcher.env
set +o allexport

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
    echo "Erreur : Argument non valide. Veuillez spécifier '$accunt1' ou '$account2' comme argument."
fi
