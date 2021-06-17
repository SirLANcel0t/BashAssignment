#!/bin/bash
#hiermee wordt een begin gemaakt van het menu om te kiezen welke functies aangeroepen worden, 
#op basis van ingegeven parameters 
#of dat dat -u -p of gewoon een bestandsnaam of wachtwoord is enzo



# while [ $# -gt 0 ] betekent letterlijk : 
# voor zolang het aantal arguments groter is dan 0, doe [iets]
# dat is handig want met shift kun je alle argumenten langslopen

# onthoud dat booleans in Bash gewoon strings zijn, die hebben verder geen functie of iets

undelete="false"
haspassword="false"
recursive="false"

while [ $# -gt 0 ]
do
    if [ $1 == "-u" ] && [ $haspassword == "false" ]
    then
        undelete="true"

    elif [ $1 == "-p" ] && [ $undelete == "false" ]
    then
        haspassword="true"
        setPassword="true"
    
    elif [ $1 == "-r" ]
    then
        recursive="true"
    
    elif [ $1 != "-p" ] && [ $1 != "-u" ] && [ $1 != "-r" ] && [ $setPassword == "true" ]
    then
        setPassword="false"
        password=$1
    
    elif [[ $1 == "-p" && $undelete == "true" ]] || [[ $1 == "-u" && $haspassword == "true" ]]
    then
        echo "Sorry, dit is geen geldige input!"
    else
        fileName=$1
    fi
shift
done
