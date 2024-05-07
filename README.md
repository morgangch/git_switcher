# :gb: git_switcher
Simple little program (maybe overcomplicated ig) that allows you to switch between 2 github accounts

## How can you setup it ?
How can you run this simple little script ?
You'll need to fill a file named ".switcher.env" with the following datas (replacing [] with the actual data) :
account1="[X]" // Name of the first github account
account1_mail="[X]" // Email for your first github account
account1_ssh="[X]" // Absolute path ("/home/...") for the ssh key of this account

account2="[X]" // Etc...
account2_mail="[X]"
account2_ssh="[X]"
If you do not want to setup it manually, you can also execute it for the first time, prompts will ask you to give the code datas that will then fill the file.

## How can you run it ?
Simple as that, once the script is setup, the datas are given, you only need to run it this way :
[path_to_program].sh [account(1 or 2)]
Example : ./git_switcher.sh Morgan
And that's all.

# :fr: git_switcher
Un simple programme (possiblement inutilement poussé) pour changer facilement de compte en bash.

## Comment mettre le programme en place ?
Comment rendre ce petit script exécutable ?
Vous aurez besoin de remplir un fichier ".switcher.env" avec les données suivantes (en remplaçant [] avec les données) :
account1="[X]" // Nom du premier compte github
account1_mail="[X]" // Email du même compte 
account1_ssh="[X]" // Chemin absolu ("/home/...") de la clé SSH de votre compte

account2="[X]" // Etc...
account2_mail="[X]"
account2_ssh="[X]"
Si vous voulez éviter de mettre le programme en place à la main, vous pouvez exécuter le script une première fois, il lancera alors une série de questions pour créer le fichier avec les bonnes données.

## Comment lancer le programme ?
Une fois le script mis en place, il suffit de le lancer de la façon suivante :
[chemin_du_programme].sh [compte(1 ou 2)]
Exemple : ./git_switcher.sh Morgan
Et c'est tout !