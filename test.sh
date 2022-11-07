#!/bin/bash
tri=${new}
command=${1}
location=${2}
name=${3}
input=${4}
case $command in
	addDir)
	mkdir $location/$name;;
	listFiles)
	ls -la $location | grep ^-;;
	listDirs)
	ls -la $location | grep ^d;;
	listAll)
	ls -la $location;;
	deleteDir)
	rmdir $location/$name;;
	addFile)
if [ $#=3 ]
then	echo > $location/$name
fi
if [ $#=4 ]
then	echo $input > $location/$name
fi
;;
	addContentToFile)
	echo $input >>$location/$name;;
addContentToFileBegining)
	echo $input > $location/new
	cat $location/$name >>$location/new
	mv $location/new $location/$name ;;

showFileBeginingContent)
	head -n 5 $location/$name;;

showFileEndContent)
	tail -n 5 $location/$name;;

showFileContentAtLine)
	head -n 10 $location/$name | tail -n 1;;

showFileContentForLineRange)
	head -n 10 $location/$name | tail -n 6;;

moveFile)
	mv $location $name;;

copyFile)
	cp $location $name;;

clearFileContent)
	echo > $location/$name;;

deleteFile)
	rm $location/$name;;

esac
