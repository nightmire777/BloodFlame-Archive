![image](https://github.com/user-attachments/assets/5ac0e293-9a9b-433d-a3c9-6cac5ba1eae7)

Familiar ui, hmmmmm 
forget it , lemme register and login 

![image](https://github.com/user-attachments/assets/3d4fcde1-641d-4034-8c71-1a64d165d369)

seems fine, till you leave a feedback 

![image](https://github.com/user-attachments/assets/81b33907-eaa2-4b0d-ad0f-89e3cd0dbba1)

it doesnt return anything.....

![image](https://github.com/user-attachments/assets/f54991e2-a5ab-4b33-8a99-84429576538b)

Looking at this, doent seems like theres an admin account, cant see any other routes in the app either...

![image](https://github.com/user-attachments/assets/5d925ce8-0553-402b-8d65-800d4a359b56)

however it does have a filter that can return something else 

After some testing, the payload was formed

INSERT INTO feedback(username, feedback) VALUES('fauna','``` tree'),('fauna', CASE WHEN (SELECT SUBSTR(flag, 1, 1) FROM flag) = 'F' THEN 'fauna' ELSE NULL END),('fauna', 'green  ```')

this reminds me of something ive done somewhere else, blind sqlli

time to pull out some wierd scripts

AND after some time, got it....

![image](https://github.com/user-attachments/assets/bc92518b-1b34-40f9-a994-21c552786cfc)
