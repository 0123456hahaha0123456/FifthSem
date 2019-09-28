#!/bin/bash
IFS=$'\n'
ERR_PATH="$HOME/lab1_err"
LOG_PATH="./logs"
print_hello(){
	echo Choose one operation pls
	echo 1.Print name of current folder
	echo 2.Change the current folder
	echo 3.Print file in current folder
	echo 4.Create a hard link to a file
	echo 5.Delete symbol link to a file
	echo 6.Create a directory and go into it
	echo 7.Exit
}

print_name_folder(){
	#basename "$PWD" 2>>"$ERR_PATH" || 'error!' 1>&2
	pwd 2>>"$ERR_PATH" || 'error!' 1>&2
}

change_folder(){
	#The script is run in a subshell, and cannot change the parent shell working directory. Its effects are lost when it finishes.
	#https://unix.stackexchange.com/qeuestions/27139/script-to-change-current-directory-cd-pwd
	echo Please write the path, which you want to go
	read path
	#echo $path
	#cd ~/Desktop
	#echo "alias change_file=\"cd $path\"" >> ~/.bashrc
	#source ~/.bashrc
	#change_file 2>>"$ERR_PATH" || 'error!' 1>&2
	#pushd "$path"
	cd $path 2>>"$ERR_PATH" || 'error!' 1>&2
}

print_file(){
	ls -l 2>>"$ERR_PATH" || 'error!' 1>&2 
}

create_hard_link(){
	echo Please write path to source file
	read sfile
	echo Please write path to hard link
	read lfile
	#ln "$sfile" "$lfile" 2>>"$ERR_PATH"  || 'error!' 1>&2 ; echo "$lfile">>"$LOG_PATH" #always write name of link to log
	ln "$sfile" "$lfile" 2>>"$ERR_PATH" || (echo "$lfile">>"$LOG_PATH"  && 'error!' 1>&2) #when create link failed, write name of link to log
}

delete_symbol_link(){
	echo Please write path to the link, which you want to delete
	read symlink
	echo "Are you sure ? (y/n) "
	read tmp
	if [ $tmp = 'y' ] 
	then
		unlink "$symlink" 2>>"$ERR_PATH" || 'error!' 1>&2 
	fi
}

create_directory_and_go(){
	echo Please writedown name of directory
	read dir
	mkdir "$dir" 2>>"$ERR_PATH" || 'error!' 1>&2
	cd $dir	
}

name=true
while $name; do
	print_hello
	read number break
	case "$number" in 
		1) print_name_folder ;;
		2) change_folder ;;
		3) print_file ;;
		4) create_hard_link ;;
		5) delete_symbol_link ;;
		6) create_directory_and_go ;;
		7) name=false ;;
	esac
	
done