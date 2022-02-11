#!/bin/bash
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

if [[ $mode = "create" ]]; then
	if [[ $project = "python" ]]; then
		path="/home/suppe/programming/PycharmProjects"
		mkdir "$path/$2"
		cd "$path/$2"
		python3 -m virtualenv venv 
	elif [[ $project = "flutter" ]]; then
		path="/home/suppe/programming/FlutterProjects"
		cd "$path"
		flutter create $2
		cd "$path/$2"
	fi

	touch README.md
	python3 /home/suppe/programming/PycharmProjects/automate_projects/create_new_repo.py $project $2
	git init
	git remote add origin git@github.com:suprabhatrijal/$2.git
	git add -A
	git commit -m "Initial Commit"
	git pull origin main --rebase
	git push origin main

elif [[ $mode = "open" && $project = "python" ]]; then
		cd "/home/suppe/programming/PycharmProjects/"
		echo "Python Projects:" 
		echo "============================================================================================================================" 
		num=1
		list_of_dirs=()
		for d in */ ; do
		echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo "============================================================================================================================" 
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		cd "/home/suppe/programming/PycharmProjects/$file"
		clear
		vim
elif [[ $mode = "open" && $project = "flutter" ]]; then
		cd "/home/suppe/programming/FlutterProjects"
		echo "Flutter Projects:" 
		echo "============================================================================================================================"
		num=1
		list_of_dirs=()
		for d in */ ; do
			echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo "============================================================================================================================"
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		cd "/home/suppe/programming/FlutterProjects/$file"
		clear
		vim
elif [[ $mode = "open" && $project = "python" ]]; then
		cd "/home/suppe/programming/PycharmProjects/"
		echo "Python Projects:" 
		echo "============================================================================================================================" 
		num=1
		list_of_dirs=()
		for d in */ ; do
		echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo "============================================================================================================================" 
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		cd "/home/suppe/programming/PycharmProjects/$file"
		vim
elif [[ $mode = "open" && $project = "flutter" ]]; then
		cd "/home/suppe/programming/FlutterProjects"
		echo "Flutter Projects:" 
		echo "============================================================================================================================"
		num=1
		list_of_dirs=()
		for d in */ ; do
			echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo "============================================================================================================================"
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		cd "/home/suppe/programming/FlutterProjects/$file"
		vim 
elif [[ $mode = "remove" && $project = "python" ]]; then
		cd "/home/suppe/programming/PycharmProjects"
		echo "Python Projects:" 
		echo "============================================================================================================================"
		num=1
		list_of_dirs=()
		for d in */ ; do
			echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo "============================================================================================================================"
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		echo "Are you sure you want to delete /home/suppe/programming/FlutterProjects/$file permanently? [Y/n]"
		read choice
		if [[ $choice = "Y" ]]; then
			rm -rf "/home/suppe/programming/PycharmProjects/$file"
			python3 /home/suppe/programming/PycharmProjects/automate_projects/delete_repo.py $file
		else
			echo "Aborted"
		fi
elif [[ $mode = "remove" && $project = "flutter" ]]; then
		cd "/home/suppe/programming/FlutterProjects"
		echo "Flutter Projects:" 
		echo "============================================================================================================================"
		num=1
		list_of_dirs=()
		for d in */ ; do
			echo "$num: $d"
			let "num += 1"
			list_of_dirs+=($d)
		done
		echo "============================================================================================================================"
		read option
		index=option-1
		file=${list_of_dirs[@]:index:1}	
		echo "Are you sure you want to delete /home/suppe/programming/FlutterProjects/$file permanently? [Y/n]"
		read choice
		if [[ $choice = "Y" ]]; then
			rm -rf "/home/suppe/programming/FlutterProjects/$file"
			python3 /home/suppe/programming/PycharmProjects/automate_projects/delete_repo.py $file
		else
			echo "Aborted"
		fi
fi
