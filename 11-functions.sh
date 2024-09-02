#!/bin/bash
userid=$(id -u)
echo "executed user id is $userid";
if [ $userid -ne 0 ]
then 
echo "user doesnot have root permissions"
exit 1;
else
echo "user have root permssion";
fi
validation[]
{

if [ $1 -ne 0 ]
then echo "executed command is true package is not these for  $2"
else command is not suceess means package for  $2 "already there"
}

dnf list installed git
if [ $? -ne 0 ]
then 
validation $? "git installation"
echo "git package need to be install"
else 
echo "package already there"
exit 1;

dnf install git

validation $? "git package"
echo "package installation is success"
else
echo "package already there";



