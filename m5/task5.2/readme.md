Task 5.2

1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are
present in it, what users exist on the system? Specify several pseudo-users, how
to define them?

cat /etc/passwd
grep serhiy /etc/passwd
serhiy:x:1000:1000:,123,0441234567,0447654321:/home/serhiy:/bin/bash


login:password:UID:GID:GECOS:home:shell

The login field contains the login name (or login) of the user.

The password field is used to store the user's password.

The UID field contains the user ID.User with ID 0 (usually root)
 is called superuser and has the right to perform any operations on the system.

Pseudo-users users (bin, daemon, syslog, proxy) whose purpose is only to run certain programs,
small identifiers (less than 100 or, in some Linux distributions, less than 500).

The GID field contains the group ID of the user.

The GECOS field stores auxiliary information about the user
(phone number, address, full name, etc.)

The home field contains the path to the user's folder (home directory).

The shell field contains data on the login shell connected to the user account.

AND GROUP
 / etc / group  - file consists of four fields, the second, the group password key,
is usually not used. The first field is the name of the group, 
the third is the group ID, and the fourth is the list of login usernames
that belong to this group.

cat /etc/group
grep serhiy /etc/group
serhiy:x:1000:

2. What are the uid ranges? What is UID? How to define it?

The UID field contains the user ID.
User with ID 0 (usually root) is called superuser and
has the right to perform any operations on the system.
ID (1-999) system users, which are used to start services
and access devices.
max ID 65534 other users

3. What is GID? How to define it?
The GID field contains the group ID of the user.
One UNIX user can belong to one or more groups,
which are used to set more than one user's rights to a particular file.

4. How to determine belonging of user to the specific group?
grep serhiy /etc/group
adm:x:4:syslog,serhiy
dialout:x:20:serhiy
cdrom:x:24:serhiy
floppy:x:25:serhiy
sudo:x:27:serhiy
audio:x:29:serhiy
dip:x:30:serhiy
video:x:44:serhiy
plugdev:x:46:serhiy
netdev:x:117:serhiy

5. What are the commands for adding a user to the system? What are the basic
parameters required to create a user?

useradd -D
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/sh
SKEL=/etc/skel
CREATE_MAIL_SPOOL=no
sudo useradd Newuser
grep Newuser /etc/passwd

6. How do I change the name (account name) of an existing user?

sudo usermod -l ReNewuser Newuser
grep ReNewuser /etc/passwd

7. What is skell_dir? What is its structure?

ls -la /etc/skel
cat /etc/default/useradd

The SKEL variable specifies the directory containing "skeletal" user
files; in other words, files such as a sample .profile that will be
copied to the new user's home directory when it is created.
SKEL=/etc/skel

8. How to remove a user from the system (including his mailbox)

sudo deluser --remove-home ReNewuser
sudo userdel -r ReNewuser   - delete user home directory and mail folder
grep ReNewuser /etc/passwd

it is recommended to log out and kill all running user processes
using the killall command

sudo killall -u Newuser   -it is recommended to log out and kill all
 running user processes using the killall command

9. What commands and keys should be used to lock and unlock a user account?

sudo useradd TESTuser
sudo passwd -l TESTuser
sudo passwd -u TESTuser

10. How to remove a user's password and provide him with a password-free
login for subsequent password change?

sudo passwd -de TESTuser
su TESTuser    -PASSWORD QAZ123!@#
su TESTuser
$ whoami
TESTuser
sudo grep TESTuser /etc/shadow

11. Display the extended format of information about the directory, tell about
the information columns displayed on the terminal.

ls -la
1 index of file/folder
2 rights of the file 3 groops owner, gpoup, other (r-read, w-write, x-execute)
3 count file in the folder
4 owner UID 
5 gpoup ID
6 size of object
7 last date modification
8 name of file or directory

12. What access rights exist and for whom (i. e., describe the main roles)?
Briefly describe the acronym for access rights.

3 group (owner, group, other)
3 rights (r-read, w-write, x-execute)
also number rights (7-rwx, 6-rw, 5-rx, 4-r, 2-w, 1-x)

13. What is the sequence of defining the relationship between the file and the
user?
1 owner
2 group
3 other

touch TEST.txt
ls -la TEST.txt
sudo chown TESTuser TEST.txt
ls -la TEST.txt
sudo chgrp TESTuser TEST.txt
ls -la TEST.txt

14. What commands are used to change the owner of a file (directory), as well
as the mode of access to the file? Give examples, demonstrate on the terminal.

ls -la TEST.txt
chmod u+x TEST.txt
ls -la TEST.txt
chmod o-r TEST.txt
ls -la TEST.txt
chmod a=rwx TEST.txt
ls -la TEST.txt

15.What is an example of octal representation of access rights? Describe the
umask command.

3 rights (r-read, w-write, x-execute)
number rights (7-rwx, 6-rw, 5-rx, 4-r, 2-w, 1-x, 0-nothing)

chmod 752 TEST.txt
serhiy@DESKTOP-QOKBTCP:~$ chmod 752 TEST.txt
serhiy@DESKTOP-QOKBTCP:~$ ls -la TEST.txt
-rwxr-x-w- 1 serhiy TESTuser 0 Dec 11 09:00 TEST.txt

16.Give definitions of sticky bits and mechanism of identifier
substitution. Give an example of files and directories
 with these attributes.

c only works for directories.
But with a Sticky bits set in the stick directory, anyone can
create a file / directory in it, but can only delete their own files.

serhiy@DESKTOP-QOKBTCP:~$ ls -ld /tmp/
drwxrwxrwt 4 root root 4096 Dec  8 15:57 /tmp/

17. What file attributes should be present in the command script?

chmod ugo+x script.sh -(example script.sh) give rights execute all groups  
atrtributes "x" for file need execute and migreate to folder
user owner /usr/local/bin

