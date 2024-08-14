alright its 3 50 in the fcuking morning idk what better to do than stf instad of sleeping, writeup time....

curl -X POST -d "username=admin&pass -d=71up-dnlkadsf" http://165.227.106.113/post.php
this is the challange link btw , you need to login to see -> https://ctflearn.com/challenge/114 

welp apparenntly this command is quite useful , yeah...
curl or client URL can help you get the webpage from terminal (as if you dont have a browser....)
it also has parameters you can use to send data for example , nice right ? (as if a browser couldnt do it)
according to the curl -h , the -d parameter allows you to send data ain a form of http post request . honestly have no idea what the -X means ahah
ok i lied , the first part of the command curl -X POST is to specify the method using the -X parameter and POST being the method in this case(other methods such as GET)
the -d basically as mentioned above allows you to send/POST data and specifies the data you want to send 

ive completed my first writeup?
i like to call them notes or better known as references , writeup too formal for this bullshit 
for now this thing is named the bloodflame archive cuz i have no idea what to name it while also listening to ERB (would have been an amazing pun if i was writting thsi on ARCH instaed of ubuntu...)
y'knwo what , maybe this can be known better as my CTF diary since i yap so much bs here ahhahaa
aaaaaaaaany ways since i last formatted pc , i lost all my progress(diary) on SKR, gotta redo it here , for now this is all i have , im a poor man , poor of information 
its 4 01 , my sleep is fucked, i havent finished my dailies , im going to sleep , need to contol the ctf addiction !!!


kk challenge 2 
another curl challange yay!!!
first try was -> curl http://165.227.106.113/header.php
- error got error saying wrong user agent , so curl mentioned that i can specify an agent (whatever that is) to enter the site.
so i tried curl --user-agent Sup3rS3cr3tAg3nt http://165.227.106.113/header.php which used the agent given by the site
- next error says i did not come from a site called awesomesauce.com (how dare he discriminate me)
therefore after some bs and more bs , i figured that i couuld use a referer
found out suing curl -help all   which btw shows all functions of curl
then the command become like this and the flag came out idk how hahahha 

curl -e awesomesauce.com  --user-agent Sup3rS3cr3tAg3nt http://165.227.106.113/header.php

challenge link -> https://ctflearn.com/challenge/109

yup thats all , fair diffuculty for meduim , my brain not too fucked HAHHAHA


