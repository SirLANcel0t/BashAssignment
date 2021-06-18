# BashAssignment

Takenlijst:

TO DO:
- Een manier om arguments van de functie te kunnen analyseren (te kijken wat de options -u -r -p zijn en wat het wachtwoord is en wat het bestandsnaam)
- Kunnen we al wachtwoorden toevoegen aan het logbestand? zodat ze uitgelezen kunnen worden?
- Alles samenvoegen
- bugtesten

DONE:
- Bestanden kunnen zippen zonder wachtwoord
- Bestanden kunnen zippen met wachtwoord
- Bestanden verplaatsen naar de trash folder
- een trash folder aanmaken in de home directory (~/) als die nog niet bestaat, geen error als hij wel bestaat
- een logbestand aanmaken die bijhoudt wat er verwijderd is, waar het vandaan kwam en of het een wachtwoord heeft
- een bevestiging vragen aan de gebruiker of hij een bepaald bestand daadwerkelijk wil verwijderen






Assignment in which we created an alias for the 'rm' command


requirements: 

1- rm will ask the user to confirm deleting the file.

2- Every deleted file will be zipped and moved to a special folder named trash, which is located in
the home directory. The program should create a trash folder under the home directory if it is not
found.

3- In case that files with the same name are deleted, only the last deleted file will be preserved in
the trash folder and the previously deleted file with the same name will be overwritten.

4- The command should be able to remove a directory and all of its subdirectories. So if it is a
directory (being removed): a single zip file will be created for the whole directory (with all the files
inside and subdirectories). The option used in this case is –r. If while deleting a directory the
option -r is not used, an error message should be printed.

5- The rm command provides the possibility of retrieving the deleted files to the current directory.
The option used here will be –u. If the file is not found in the trash folder, an error message will
be given. The command verifies if any file with the same name exists in the current directory, in
which case a warning is printed on the screen and the user is asked to confirm replacing the
existing file.

6- Optionally, when deleting a file, the user may add a password to encrypt the file the password
protected zip. In case of the retrieval of a password-protected file, rm command will prompt the
user to provide the password. The option, in this case, will be –p password. For instance, the
command rm –p passme ./data.txt should zip and password protect data.txt file and move it to
the trash subdirectory.

7- rm maintains a file inside the trash folder that contains the list of the deleted files and whether
they are password protected or not. When a file is deleted, a line is added to this file, and when a
file is retrieved, the corresponding line is removed. If a deleted file has been zipped with a
password, the rm command should ask for the password by printing a message on the screen. If
the provided password is incorrect, the command will repeat asking for the password two more
times.

# alle arguments op een rijtje;
# rm [bestandsnaam]  ; verwijdert een bestand door het te zippen en naar trash te verhuizen
# rm -u [bestandsnaam]   ; maakt het verwijderen ongedaan
# rm -p [wachtwoord] [bestandsnaam]  ; verwijdert een bestand door het naar trash te verhuizen met een wachtwoord
# rm -u [bestandsnaam] ;  als het bestand met een wachtwoord beveiligd is, dan wordt er gevraagd om het wachtwoord voordat je het terug kan halen
# rm -r [foldernaam] ; verwijdert een hele folder met alles erin
# rm -u [foldernaam] ; maakt het verwijderen van een folder ongedaan
# rm -r -p [wachtwoord] [foldernaam] ; verwijdert een folder met alles erin en beveiligt het met een wachtwoord
# rm -u [foldernaam] ; maakt het verwijderen van een folder ongedaan en als er een wachtwoord bij zat dan vraagt hij om het wachtwoord