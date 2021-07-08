username=$(whoami)

if [ -d /home/$username ]
then
  continue
else
  echo Invalid User
  exit
fi

if [ -f /home/$username/To-Do/db.txt ]
then
  taskno=`grep "" -c /home/$username/To-Do/db.txt`
else
  touch /home/$username/To-Do/db.txt
  taskno=0
fi

echo Do you wanna enter some Task y/n
read decision
if [ $decision = 'y' -o $decision = 'Y' ]
then    
  echo Press Ctrl D to Save State and press again to Save
  taskno=`expr $taskno + 1`
  echo -n "$taskno".\) "" >> /home/$username/To-Do/db.txt
  cat >> /home/$username/To-Do/db.txt
  echo "" >> /home/$username/To-Do/db.txt
fi

echo "\nDo you wanna delete some taskno y/n"
read decision
if [ $decision = 'y' -o  $username = 'Y' ]
then
  cat /home/$username/To-Do/db.txt
  echo Enter The Task Number To Delete
  read deletetask
  touch /home/$username/To-Do/temp.txt
  grep -v "$deletetask".\)"" /home/$username/To-Do/db.txt >> /home/$username/To-Do/temp.txt && mv /home/$username/To-Do/temp.txt /home/$username/To-Do/db.txt
  echo "Task $deletetask Removed"
fi
