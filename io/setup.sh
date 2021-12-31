#!/bin/bash
filename=file.txt

if [ -f "$filename" ]
then
    echo "Test file already exists.."
    echo "Remove file and continue or stop? Y/n"
    read answer
    if [ $answer = "N" ]
    then
        echo "Process ending..."
        exit
    else
        echo "Removing file..."
        rm $filename
    fi
else
    touch $filename
fi

counter=1
while [ $counter -le 10 ]
do
    echo ${counter}" Line"  >> $filename
    counter=$(( $counter + 1 ))
done

echo "File created."

echo "Start processing file"
dart file_read_write.dart file.txt