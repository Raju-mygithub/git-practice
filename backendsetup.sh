USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ] 
        then
        echo "please run this script using root permissions"
        exit 1
        else 
        echo "You have root permissions"
        fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$2 is failed"
    else
    echo "$2 is success"
    fi
}
CHECK_ROOT

dnf module disable nodejs -y
VALIDATE $? "disabling nodejs"
dnf module enable nodejs:20 -y
VALIDATE $? "Enabling nodejs"
dnf install nodejs -y
VALIDATE $? "Installing nodejs"
id expense
if [ $? -ne 0 ]
then
echo "expense user not there need to create"
user add expense
validation $? "Adding user expense"
else
echo "Expense user already exsists, skipping.."
fi
mkdir /app
VALIDATE $? "Creatinf folder"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
VALIDATE $? "downloading code"
cd /app
rm -rf /app/*
unzip /tmp/backend.zip
VALIDATE $? "unzipping code"
npm install
cp /home/ec2-user/git-practice/backend.service /etc/systemd/system/backend.service
VALIDATE $? "copyingbackendserviceconf"
dnf install mysql -y
VALIDATE $? "installing mysql"
mysql -h backendapp.mydevops22.online -uroot -pExpenseApp@1 < /app/schema/backend.sql
VALIDATE $? "validating schema"
systemctl daemon-reload
VALIDATE $? "reloading daemon"

systemctl enable backend
VALIDATE $? "Enabling backen"
systemctl restart backend
VALIDATE $? "Staring backend"
