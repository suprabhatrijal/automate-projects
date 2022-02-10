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
		mkdir "$path/$1"
		cd "$path/$1"
		python3 -m virtualenv venv 
	elif [[ $project = "flutter" ]]; then
		path="/home/suppe/programming/FlutterProjects"
		cd "$path"
		flutter create $1
		cd "$path/$1"
	fi

	touch README.md
	python3 /home/suppe/programming/PycharmProjects/automate_projects/create_new_repo.py $project $1
	git init
	git remote add origin git@github.com:suprabhatrijal/$3.git
	git add -A
	git commit -m "Initial Commit"
	git pull origin main --rebase
	git push origin main
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
fi
