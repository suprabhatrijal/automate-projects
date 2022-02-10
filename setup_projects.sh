#!/bin/bash

while getopts colpf flag
do
    case "${flag}" in
        c) mode="create";;
        o) mode="open";;
        l) mode="list";;
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

elif [[ $mode = "list" && $project = "python" ]]; then
		cd "/home/suppe/programming/PycharmProjects"
		echo "Python Projects:" 
		echo "============================================================================================================================" 
		ls -1
		echo "============================================================================================================================" 
elif [[ $mode = "list" && $project = "flutter" ]]; then
		cd "/home/suppe/programming/FlutterProjects"
		echo "Flutter Projects:" 
		echo "============================================================================================================================" 
		ls -1
		echo "============================================================================================================================" 
elif [[ $mode = "list" ]]; then
		cd "/home/suppe/programming/PycharmProjects"
		echo "Python Projects:" 
		echo "============================================================================================================================" 
		ls -1
		echo "============================================================================================================================" 
		cd "/home/suppe/programming/FlutterProjects"
		echo "Flutter Projects:" 
		echo "============================================================================================================================" 
		ls -1	
		echo "============================================================================================================================" 
		
elif [[ $mode = "open" && $project = "python" ]]; then
		cd "/home/suppe/programming/PycharmProjects/$2"
		vim
elif [[ $mode = "open" && $project = "flutter" ]]; then
		cd "/home/suppe/programming/FlutterProjects/$2"
		vim
fi
