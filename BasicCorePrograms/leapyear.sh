#! /bin/bash
#Leap Year


isleapyear(){
if [ $(($year % 4)) -eq 0  -a   $(($year % 100)) -ne 0  -o  $(($year % 400)) -eq 0 ]
then	
	echo "leap year"
else
	echo "not leap year" 
fi
}
echo "enter year"
read year
myvar=`expr length "${year}"
isleapyear $year``
else
	echo "invalide"
fi
