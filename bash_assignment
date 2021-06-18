#!/bin/bash

# alle arguments op een rijtje;
# rm [bestandsnaam]  ; verwijdert een bestand door het te zippen en naar trash te verhuizen
# rm -u [bestandsnaam]   ; maakt het verwijderen ongedaan
# rm -p [wachtwoord] [bestandsnaam]  ; verwijdert een bestand door het naar trash te verhuizen met een wachtwoord
# rm -u [bestandsnaam] ;  als het bestand met een wachtwoord beveiligd is, dan wordt er gevraagd om het wachtwoord voordat je het terug kan halen
# rm -r [foldernaam] ; verwijdert een hele folder met alles erin
# rm -u [foldernaam] ; maakt het verwijderen van een folder ongedaan
# rm -r -p [wachtwoord] [foldernaam] ; verwijdert een folder met alles erin en beveiligt het met een wachtwoord
# rm -u [foldernaam] ; maakt het verwijderen van een folder ongedaan en als er een wachtwoord bij zat dan vraagt hij om het wachtwoord




#Main functie zodat we die aan het eind als alias kunnen gebruiken.
#alles gebeurt in Main
Main(){



    MakeTrashFolder()
        {
        #deze functie maakt de trash folder in de home directory, indien die nog niet bestaat.
        #als de trash folder wel al bestaat, gaat er ook niks mis of iets.
        mkdir -p  ~/trash
        
        #hij moet ook een tekstbestand maken wat bijhoudt welke bestanden verwijdert zijn en welke niet, en of ze met een wachtwoord beveiligd zijn.
        
        #ik gebruik de touch command , want die maakt het aan als het bestand niet bestaat, 
        #en anders 'raakt hij het aan', dan wordt 'date modified' geupdate. meer ook niet
        
        touch ~/trash/logger.txt
        
        #getest, dit werkt
        }
        


    MoveAFile()
        {
        #dit werkt nog niet helemaal. bestanden zonder spatie werken, maar bestanden met spatie geeft een wazige error
        #
        
        mv $1 ~/trash
        echo "$1, pw=false" >> ~/trash/logger.txt
        }
        

    ZipAFile()
        {
        #de syntax om iets te zippen is als volgt:
        #zip [archiefnaam] [bestandnaam]
        zip $1.zip $1
        mv $1.zip ~/trash
        path=$(realpath $1)
        echo "$path, pw=false" >> ~/trash/logger.txt
        }  
        
    
    ZipAFilePW()
        {
        #de syntax om iets te zippen is als volgt:
        #zip [archiefnaam] [bestandnaam]
        zip -e $1.zip $1
        mv $1.zip ~/trash
        path=$(realpath $1)
        echo "$path, pw=true" >> ~/trash/logger.txt
        }  
        

    GetFileFromLog()
        {
        result=$(grep -oP \^\.\*$1 trash/logger.txt)
        echo "$result"
        }
        
        MakeTrashFolder
        #MoveAFile $1
        #ZipAFilePW $1
        GetFileFromLog $1


} 

alias rm=Main
