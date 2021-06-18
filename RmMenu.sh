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
    if [ $1 == "-u" ]
    then
        undelete="true"
    fi
    #zouden dit niet elif statements moeten zijn? hmm
    
    if [ $1 == "-p" ]
    then
        haspassword="true"
    fi
    
    if [ $1 == "-r" ]
    then
        recursive="true"
    fi
   
shift
done

echo $undelete
echo $haspassword
echo $recursive
