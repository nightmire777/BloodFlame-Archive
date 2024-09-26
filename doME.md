this file should be better than the other as the name states....


# --- 
first try was -> curl http://165.227.106.113/header.php
- error got error saying wrong user agent , so curl mentioned that i can specify an agent (whatever that is) to enter the site.
so i tried curl --user-agent Sup3rS3cr3tAg3nt http://165.227.106.113/header.php which used the agent given by the site
- next error says i did not come from a site called awesomesauce.com (how dare he discriminate me)
therefore after some bs and more bs , i figured that i couuld use a referer
found out using curl -help all   which btw shows all functions of curl
then the command become like this and the flag came out idk how hahahha 

curl -e awesomesauce.com  --user-agent Sup3rS3cr3tAg3nt http://165.227.106.113/header.php

challenge link -> https://ctflearn.com/challenge/109

yup thats all , fair diffuculty for meduim 

# ---
okok legit final oen for today
challenge -> https://ctflearn.com/challenge/691

this one quite simple, nc commect to the server , play the betting game 
simple concept of betting , guess a number, win = ur money + initial bet, loose = initial money - bet
so if 500 - 500 = 1000 , that explains all i need to redeem the flag 

