#!/bin/bash

echo "Répertoire du fichier que vous voulez trouver : $1"
echo "Nom du fichier + son répertoire : $2"


echo "                                                                               ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓████████▓▒░▒▓███████▓▒░  "
echo "                                                                               ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
echo "                                                                               ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
echo "                                                                               ░▒▓█▓▒▒▓███▓▒░▒▓███████▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░  "
echo "                                                                               ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        "
echo "                                                                               ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        "
echo "                                                                                ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░"
echo " "
echo -e "                                                                                               \033[1mChercheur de lignes\033[0m"
echo -e "                                                                                                       \033[1mpar \033[0m"
echo -e "                                                                                                   \033[1m@tayoken_ytd\033[0m"

echo " "


echo "************Option***************"
echo '1) Je veux trouver les lignes avec un caractère (Considérer Casse)'
echo '2) Je veux trouver les lignes avec un caractère (Sans Casse)'
echo '3) Je veux avoir toutes les lignes sans un caractère'
echo '-------Avec plusieurs lignes------'
echo '4) Je veux trouver les lignes avec un caractère (Considérer Casse)'
echo '5) Je veux trouver les lignes avec un caractère (Sans Casse)'
echo '6) Je veux avoir toutes les lignes sans un caractère'
echo "********************************"

read option

if [ "$option" -lt 4 ]; then
    echo "*******Choisir la chaine de caractère à trouver*******"
    echo -e "\033[1mNote: Utilisez '*' et '$' pour dire où doit se trouver votre chaine\033[0m"
    echo -e "\033[1mAvant (ex: *a)= l'élement se trouve au debut de ligne Après (ex: 'a$') votre élément se trouve en fin de ligne\033[0m"
    read trouv
    echo "Le caractère choisi est : $trouv"
    echo "******************************************************"
    
    if [ "$option" -eq 1 ]; then
        opt=""
    fi

    if [ "$option" -eq 2 ]; then
        opt="-i"
    fi

    if [ "$option" -eq 3 ]; then
        opt="-v"
    fi

else
    echo "*******Choisir les caractères à trouver*******"
    echo -e "\033[1mNote: Utilisez '*' et '$' pour dire où doit se trouver votre chaine\033[0m"
    echo -e "\033[1mAvant (ex: *a)= l'élement se trouve au debut de ligne Après (ex: 'a$') votre élément se trouve en fin de ligne\033[0m"
    echo "Caractère 1 : "
    read car1
    echo "Caractère 2 : "
    read car2
    echo "**********************************************"
    
    if [ "$option" -eq 4 ]; then
        opt=""
    fi

    if [ "$option" -eq 5 ]; then
        opt="-i"
    fi

    if [ "$option" -eq 6 ]; then
        opt="-v"
    fi
fi

cd "$1" || { echo "Erreur : Impossible d'accéder au répertoire $1"; exit 1; }

if [ "$option" -lt 4 ]; then
    resul=$(grep $opt "$trouv" "$2")
else
    resul=$(grep $opt -e "$car1" -e "$car2" "$2")
fi

echo "$resul"
