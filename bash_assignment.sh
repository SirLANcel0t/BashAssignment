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
        

    ZipAFile()
        {
        #de syntax om iets te zippen is als volgt:
        #zip [archiefnaam] [bestandnaam]
        zip -qqrm $filename.zip $filename
        mv $filename.zip ~/trash
        path=$(realpath $filename)
        echo "$path, pw=false" >> ~/trash/logger.txt
        }  
        
    
    ZipAFilePW()
        {
        #de syntax om iets te zippen is als volgt:
        #zip [archiefnaam] [bestandnaam]
        zip -qqerm $filename.zip $filename
        mv $filename.zip ~/trash
        path=$(realpath $filename)
        echo "$path, pw=true" >> ~/trash/logger.txt
        }  
         
 
#     GetFileFromLog()
#         {
#         result=$(grep -oP \^\.\*$1 trash/logger.txt)
#         echo "$result"
#         }
    
    
    Undelete()
        {
#             result=$(grep -oP '.*/(?=\Q'"$filename"'\E)' ~/trash/logger.txt)
            unzip ~/trash/$filename #-d $result
            grep -v $filename ~/trash/logger.txt > ~/trash/logger.txt.tmp
            mv ~/trash/logger.txt.tmp ~/trash/logger.txt
            \rm ~/trash/$filename".zip"
        }
        
    Confirmation()
        {

        echo "Are you sure you want to delete this file?" 
        echo "Type Y or N"
        
        read answer
        
        if [[ "$answer" == "Y" || "$answer" == "y" ]]
        then
            # en dan hier de functie die uitgevoerd wordt
            # verwijder iets
            echo "removing"
            
        elif [[ "$answer" == "N" || "$answer" == "n" ]]
        then
            # en dan hier.... niet. hier gebeurt niks
            echo "oke dan niet"
            
        else    
            echo "Input not recognised. Please try again "
            
        fi
        }


    #dit analyseert alle arguments, of het options, een password of een bestandsnaam is
    AnalyseArguments()
        {
        undelete="false"
        haspassword="false"
        recursive="false"
        filename=""
        password=""

        while [ $# -gt 0 ]
        do
            if [[ $1 == "-u" && $haspassword == "false" ]]
            then
                undelete="true"

            elif [[ $1 == "-p" && $undelete == "false" ]]
            then
                haspassword="true"
                setpassword="true"
            
            elif [ $1 == "-r" ]
            then
                recursive="true"
            
            elif [[ $1 != "-p" && $1 != "-u" && $1 != "-r" && $setpassword == "true" ]]
            then
                setpassword="false"
                password=$1
                
            elif [[ $1 == "-p" && $undelete == "true" ]] || [[ $1 == "-u" && $haspassword == "true" ]]
            then
                echo "rm+: cannot use -u and -p at the same time"
                
            elif [[ $undelete == "false" && $recursive == "false" && -d ~/$1 ]]
            then
                echo "rm+: cannot remove a directory without -r"
                
#             elif ! [[ -e $1 || -e ~/$1 || $1 == "-u" || $1 == "-p" || $1 == "-r" ]]
#             then
#                 echo "rm+: this file or directory does not exist"
            else
                filename=$1
            fi
        shift
        done
        }
        

        ChooseFunction()
        {
            #als password true is en delete is true, voer dan dit uit 
            #als undelete true is, voer dan iets anders uit 
            #kies hier welke functies uitgevoerd worden, je kent het wel
            
            if [ $haspassword == "true" ]
            then
                if [ $undelete == "true" ]
                then
                    Undelete
                else
                    ZipAFilePW
                fi
            else
                if [ $undelete == "true" ]
                then
                    Undelete
                else
                    ZipAFile
                fi                
            fi
        }
        
#=============================================================================#
#dit waren alle functies, hieronder hoe en wanneer het uitgevoerd gaat worden #
#=============================================================================#

    #altijd MakeTrashFolder, want waarom niet. als de folder al is, gebeurt er toch niks
    MakeTrashFolder
    
    #deze functie analyseert alle inkomende arguments
    AnalyseArguments "$@" 
    
    #op basis van ingevoerde arguments, wordt gekozen wat er uitgevoerd gaat worden!
    ChooseFunction 



} 

alias rm=Main
