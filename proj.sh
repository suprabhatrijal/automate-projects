#!/bin/bash

# variables
line="============================================================================================================================" 
python_path="/home/suppe/programming/PycharmProjects"
flutter_path="/home/suppe/programming/FlutterProjects"

# flags
while getopts cropf flag
do
		case "${flag}" in
				c) mode="create";;
				r) mode="remove";;
				o) mode="open";;
				p) project="python";;
				f) project="flutter";;
		esac
done
# flags

# create
if [[ $mode = "create" ]]; then
	# if the user has entered a project name
	if [[ $2 != "" ]]; then
		# python
		if [[ $project = "python" ]]; then
			path="/home/suppe/programming/PycharmProjects"
			mkdir "$python_path/$2"
			cd "$python_path/$2"
			python3 -m virtualenv venv 
		# flutter
		elif [[ $project = "flutter" ]]; then
			cd "$flutter_path"
			flutter create $2
			cd "$flutter_path/$2"
		fi
		touch README.md
		python3 /home/suppe/programming/PycharmProjects/automate_projects/create_new_repo.py $project $2
		git init
		git remote add origin git@github.com:suprabhatrijal/$2.git
		git add -A
		git commit -m "Initial Commit"
		git pull origin main --rebase
		git push origin main		
	# if the user has not entered a project name
	else
		echo "Enter a name for the project"
	fi
# create

# open
elif [[ $mode = "open" ]]; then
	# python
	if [[ $project == "python" ]]; then
		cd $python_path
		echo "Python Projects:" 
		echo $line
		num=1
		list_of_dirs=()
		for d in */ ; do
		echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo $line
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		cd "$python_path/$file"
		clear
		vim
	# flutter
	elif [[ $project = "flutter" ]]; then
		cd $flutter_path
		echo "Flutter Projects:" 
		echo $line
		num=1
		list_of_dirs=()
		for d in */ ; do
			echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo $line		
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		cd "$flutter_path/$file"
		clear
		vim	
	fi
# open

# remove
elif [[ $mode = "remove" ]]; then
	# python
	if [[ $project == "python" ]]; then
		cd $python_path
		echo "Python Projects:" 
		echo $line
		num=1
		list_of_dirs=()
		for d in */ ; do
		echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo $line
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		echo "Are you sure you want to delete /home/suppe/programming/PycharmProjects/$file permanently? [Y/n]"
		read choice
		if [[ $choice = "Y" ]]; then
			rm -rf "$python_path/$file"
			python3 /home/suppe/programming/PycharmProjects/automate_projects/delete_repo.py $file
		else
			echo "Aborted"
		fi
	# flutter
	elif [[ $project = "flutter" ]]; then
		cd $flutter_path		
		echo "Flutter Projects:" 
		echo $line
		num=1
		list_of_dirs=()
		for d in */ ; do
			echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo $line
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		echo "Are you sure you want to delete /home/suppe/programming/FlutterProjects/$file permanently? [Y/n]"
		read choice
		if [[ $choice = "Y" ]]; then
			rm -rf "$flutter_path/$file"
			python3 /home/suppe/programming/PycharmProjects/automate_projects/delete_repo.py $file
		else
			echo "Aborted"
		fi
	fi
# remove
fi
