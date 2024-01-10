#!/bin/bash
basepath=$(dirname $0)
gitversion=$1



function git_release_list()
{
	if [ "$gitversion" != "" ]; then
		last_git=`git rev-parse --short HEAD`
		echo show: "$gitversion" -\> "$last_git" to history_gitlog.csv
		git log $last_git $gitversion^!   --reverse --date=iso --pretty=format:'"%h","%an","%ad","%s"' >$basepath/history_gitlog.csv
    else
		echo a commit id is necessary
	fi
}

git_release_list