TASK 5.1

1. Login to system as root user
su root
whoami

2. Use the passwd command to change the password. Examine the basic
parameters of the command. What system file does it change *?

sudo passwd root
 New password:
su root	

3. Determine users in host

cat /etc/passwd

 list of a users
  if i need only names
sed 's/:.*//' /etc/passwd

  looking users active now in system
w
last -a
finger serhiy

4. Change personal information about me

chfn serhiy

5. Become familiar with the Linux help system and the man and info commands.
Get help on the previously discussed commands, define and describe any two
keys for these commands. Give examples.

man finger
man w

finger -m serhiy
w -s
w -i

6. Explore the more and less commands using the help system. View the contents
of files .bash* using commands

  Task1.Part2
1. Examine the tree command. Master the technique of applying a template, for
example, display all files that contain a character c, or files that contain a
specific sequence of characters. List subdirectories of the root directory up to
and including the second nesting level.

sudo apt install tree
tree
sudo tree -L 2 -P '*c*'

2. What command can be used to determine the type of "file" (for example, text or
binary)? Give an example.

file comp_bd.sql
file DevOps_online_Kiev_2021Q4
file DevOps_online_Kiev_2021Q4/m1/task1.1/readme.txt
file DevOps_online_Kiev_2021Q4/m2/task2.2/KeyFrankfurt.pem
file .bashrc

3. Master the skills of navigating the file system using relative and absolute paths.
How can you go back to your home directory from anywhere in the filesystem?

cd /etc Go to the directory etc
cd ..   Go to the directory one level above
cd ../.. Go to the directory two level above
cd ~     Go to user home directory
cd -     Go to the directory where you were before

4. Become familiar with the various options for the ls command. Give examples
of listing directories using different keys. Explain the information displayed on
the terminal using the -l and -a switches

ls
ls -l
ls -l --author
ls -lh
ls -la
ls -m /

5. Perform the following sequence of operations:
- create a subdirectory in the home directory;
- in this subdirectory create a file containing information about directories
located in the root directory (using I/O redirection operations);
- view the created file;
- copy the created file to your home directory using relative and absolute
addressing.
- delete the previously created subdirectory with the file requesting removal;
- delete the file copied to the home directory.

mkdir subdir_homedir
tree -dL 1 > subdir_homedir/info.txt
cat subdir_homedir/info.txt
cp subdir_homedir/info.txt ~/inforelative.txt 
cp subdir_homedir/info.txt /home/serhiy/infoabsolute.txt
rm -r subdir_homedir
rm inforelative.txt infoabsolute.txt
ls -la

6. Perform the following sequence of operations:
- create a subdirectory test in the home directory;
- copy the .bash_history file to this directory while changing its name to
labwork2;
- create a hard and soft link to the labwork2 file in the test subdirectory;
- how to define soft and hard link, what do these
concepts;
- change the data by opening a symbolic link. What changes will happen and
why
- rename the hard link file to hard_lnk_labwork2;
- rename the soft link file to symb_lnk_labwork2 file;
- then delete the labwork2. What changes have occurred and why?

mkdir test
cp .bash_history test/labwork2
cd test
ln -P labwork2 hardlink
ln -s labwork2 softlink
ls -li
nano softlink
less -s softlink
less -s labwork2
mv hardlink hard_lnk_labwork2 && mv softlink symb_lnk_labwork2
rm labwork2
ls 
less hard_lnk_labwork2
less symb_lnk_labwork2

		Difference between hard and soft link.
	A hard link is a separate file and leads to a specific location on the hard drive.
 	The file can be moved between directories. You cannot link to folders, 
	the permission of the hard link is changed at the same time,
	 and when the permission of the file is changed. 
	When you delete or move the file, the link remains.

	A soft link can refer to files and folders.
	 After deleting, moving and renaming the file, the link is not valid.
	 When you change the file's access rights, the link rights remain unchanged.


7. Using the locate utility, find all files that contain the squid and traceroute
sequence.

sudo apt install mlocate
sudo updatedb
locate -A squid
locate -A traceroute

8.Determine which partitions are mounted in the system, as well as the types of
these partitions.

df 		answer /dev/sdb       263174212   2274192 247461864   1% /("/" disk root)
lsblk -r | grep '/$'

9. Count the number of lines containing a given sequence of characters in a given
file.

less -N test/hard_lnk_labwork2   (flag -N number line)
less test/hard_lnk_labwork2 | wc -l (show caunt line in file)

10. Using the find command, find all files in the /etc directory containing the
host character sequence.

cd /etc/ && sudo find -type f -name "*host*"

11. List all objects in /etc that contain the ss character sequence. How can I
duplicate a similar command using a bunch of grep?

ls -al | grep --color "ss"

12. Organize a screen-by-screen print of the contents of the /etc directory. Hint:
You must use stream redirection operations.

ls -lah | less

13. What are the types of devices and how to determine the type of device? Give
examples.

Device files can be classified in two ways. The first is based on data flow.
In TTY and other character devices, data is processed one character or byte at a time.
In block devices such as hard disks, data is transferred in blocks,
usually in multiples of 256 bytes. The first character on each line indicates the type of device.
	The character "b" denotes linux block devices (block),
and the character "c"- (character) devices.

ls -lah /dev

14. How to determine the type of file in the system, what types of files are there?

ls -l /dev/ | grep "^b"
ls -l /dev/ | grep "^c"
ls -l /dev/ | grep "^l"
ls -l /dev/ | grep "^p"
ls -l /dev/ | grep "^d"
ls -l /bin/ | grep "^-"

Can used comand 'file'
file -l
file /etc/passwd

15. List the first 5 directory files that were recently accessed in the /etc
directory.

ls -ltr /etc/|tail -n 5



