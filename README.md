# BashAssignment
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
