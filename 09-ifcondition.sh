userid=$[ id -u ]
echo "userid of executed user is $userid";
if [ $userid -ne 0 ]
then
echo "user doesnot have root permissions";
exit 1;
else "user have root permission";
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "mysql not installed ,please install it."

dnf install mysql -y

if [ $? -ne 0 ]
then 
echo "mysql not installed please check it";
exit 1
else
echo "mysql installed successfully"
fi
else 
echo "mysql alreay installed please check."
fi