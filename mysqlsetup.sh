#!/bin/bash
USERID=$(id -u)
CHECK_ROOT(){
    if [$USERID -ne 0 ] 
        then
        echo "please run this script using root permissions"
        exit 1
        else 
        echo "You have root permissions"
        fi
}

VALIDATE(){
    if [$1 -ne 0]
    then
    echo "$2 is failed"
    else
    echo "$2 is success"
    fi
}

dnf install mysql-server -y
VALIDATE $? "Installing mysql"
systemctl enable mysqld
VALIDATE $? "Enabling mysql"
systemctl start mysqld
VALIDATE $? "Starting mysql"
mysql -h db.mydevops22.online -u root -pExpenseApp@1 -e 'show databases'
if [ $? -ne 0]
then
echo "msql password not setup setting up passwd"
mysql_secure_installation --set-root-pass ExpenseApp@1
VALIDATE$? "passwdsettingup"
else
echo "passwd already setu , skipping"
fi

