#!/bin/bash/

LOGS_FOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

userid=$(id -u)

CHECK_ROOT(){
    if [ $userid -ne 0 ]

    then
    echo "user doesnot have root permissions, please login with root"
    exit 1
    else 
    echo "user have root permssions"

    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo "$2 $package failed,please check"
    exit 1
    else
    echo "$2 $package suceess,you can proceed"
    fi

}

CHECK_USAGE(){

    echo "usage of script like scriptname and give arguments"
}
CHECK_ROOT


if [ $# -eq 0 ]
then
CHECK_USAGE

fi

for package in $@
do 
dnf list installed $package
if [ $? -ne 0 ]
then 
echo "$package not listed ,please installit"

dnf install $package -y
VALIDATE $? "installed package for $package"
else
echo "$package already there , nothing do"

fi
done



