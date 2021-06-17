#!/bin/bash


Confirmation()
    {
    # nog even een while loop misschien? zodat ie blijft loopen totdat je een
    # goed antwoord geeft
    echo "Are you sure you want to delete this file?" 
    echo "Type Y or N"
    
    read answer
    
    if [[ answer == "Y" || answer == "y" ]]
    then
        # en dan hier de functie die uitgevoerd wordt
        echo "deleting file..."
        
    elif [[ answer == "N" || answer == "n" ]]
    then
        # en dan hier.... niet. hier gebeurt niks
        echo "oke dan niet"
        
    else    
        echo "Input not recognised. Please try again "
        
    fi
    }
