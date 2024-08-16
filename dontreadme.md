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


# kk challenge 2 
another curl challange yay!!!
first try was -> curl http://165.227.106.113/header.php
- error got error saying wrong user agent , so curl mentioned that i can specify an agent (whatever that is) to enter the site.
so i tried curl --user-agent Sup3rS3cr3tAg3nt http://165.227.106.113/header.php which used the agent given by the site
- next error says i did not come from a site called awesomesauce.com (how dare he discriminate me)
therefore after some bs and more bs , i figured that i couuld use a referer
found out using curl -help all   which btw shows all functions of curl
then the command become like this and the flag came out idk how hahahha 

curl -e awesomesauce.com  --user-agent Sup3rS3cr3tAg3nt http://165.227.106.113/header.php

challenge link -> https://ctflearn.com/challenge/109

yup thats all , fair diffuculty for meduim , my brain not too fucked HAHHAHA

# challange 3
I HAVE TO SAY , NO WEED OR GACHA PULLS SHOULD BE ABLE TO BEAT THE HIGH I JUST FELT SOLVING MY FIRST HARD CHALLANGE 
alright so heres the story and challenge link : https://ctflearn.com/challenge/149
so yeah this gonna be a long story , future me or whoever i share this with , get ready

the website has a simple ui that allows you to search for dogs by typing in an id (no checking btw)
after some test , there are 3 dogs in the database each with id 1-3
When each of these numbers are types in , the page displays the dog name , breed and color 

1st attempt starts with a basic sql injection from -> https://www.w3schools.com/sql/sql_injection.asp
The page then returned the data of all 3 dogs. 
This proves the site is inject-able and vulnerable.
Next step , find the damn flag...

In the challege tittle , it mentions union is a good command.
In sql , union basicaly uunites things, allowing the user to combinee the output of 2 select commands together provided they are of same datatype. 
Both select command also need to select the same command. 
Well, guess what i did , yes i tried to guess the style of the query like an idiot. 
1st guess : select * from dogs where id = 'userinput'
with this many attempts i took and none succeeded , not even outputting the 1st dog's name. 

After a few hours of searching , i came across something about information.schema.tables. 
OH , after 1 semester of sql , i didnt even know this table existed....
In fact , many more tables not only this one....
that aside, i tried to enter some strings like 

' UNION NULL,NULL,NULL,NULL -- 
as i figured that the table would only have a maximum of 4 columns.

' UNION SELECT * FROM information.schema.tables -- 
as i thought i might just get everything from that table, unfortunately no...

1 or 2 days later (i forgot , memory got hazy from all the sqli)
i looked up union attacks and even tried to intercept the request with burpsuite , no luck
Then i re-read the comments and saw a tool named sqlmap which many claimned to be the easiest way to do it. 
I looked up the github , and installed the tool on my ubuntu. 

At first i ran it  - python3 sqlmap.py -url "https://web.ctflearn.com/web8/?id=1"
not much return , following the error messages , i slowly finetune the command into this thing: 
python3 sqlmap.py -url "https://web.ctflearn.com/web8/?id=1" --technique=U --random-agent --dbms=mysql --tamper=space2comment

cant explain all but i know what some do
- url specifies the url to attack
- technique specifies the technique to use in this case being a union attack
- dbms specifies the database type which sqlmap has already found out being mysql
- i have absolutely no idea what the other 2 do but here is the explanation -> https://github.com/sqlmapproject/sqlmap/wiki/Usage

finally the program returned 3 files, a log file , target file and lastly a file named 'session.sqlite'
unfortunatly the session file could not be opened while both text files were repeated information showed in the terminal 
but it DID give something useful, which was the payload used to attack:

Parameter: id (GET)
    Type: UNION query
    Title: Generic UNION query (NULL) - 4 columns
    Payload: id=1 UNION ALL SELECT NULL,NULL,CONCAT(0x71626a7071,0x736746507445514d6c6d794b6e65535a4d514a784959674a694474465443666e4145794e51454e41,0x7162787071),NULL-- -


i then used the payload to craete this attempt: 
1 UNION ALL SELECT NULL,CONCAT(0x71626a7071,0x736746507445514d6c6d794b6e65535a4d514a784959674a694474465443666e4145794e51454e41,0x7162787071),NULL,NULL-- -
it worked but only returned the decryped hex value in the input. 
references for this attempt : https://www.mssqltips.com/sqlservertutorial/196/information-schema-tables/ 

Next attempt :
1 UNION ALL SELECT TABLE_NAME,TABLE_TYPE,TABLE_CATALOG,TABLE_SCHEMA FROM information_schema.tables-- -
the page returned many tables but one felt off, it was w0w_y0u_f0und_m3
sadly it was not the flag...
references for this try : https://dev.mysql.com/doc/refman/8.4/en/information-schema-columns-table.htmlc , https://www.mssqltips.com/sqlservertutorial/183/information-schema-columns/

3rd attempt: 
1 UNION ALL SELECT TABLE_NAME,COLUMN_NAME,TABLE_SCHEMA,TABLE_CATALOG FROM information_schema.columns-- -
this time the page returned many things , including a column 'f0und_m3' from the table 'w0w_y0u_f0und_m3'


last attempt : 
1 UNION ALL SELECT NULL,f0und_m3,NULL,NULL FROM w0w_y0u_f0und_m3-- -
it returned the information of the first dog and the flag 

alright thats a grandfather level story , time to rest , enough games today 













