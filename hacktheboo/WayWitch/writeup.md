i hate myself for this one



<p align="center">
    <img src="https://github.com/user-attachments/assets/f896f9e4-0fbc-4b00-8fcb-e804c7981a1e">
</p>


oooo witches, very scary


![image](https://github.com/user-attachments/assets/815064ef-5c8f-4a96-952b-f9939ca4da12)

![image](https://github.com/user-attachments/assets/d76a2972-7d81-4c2f-b64b-d4aabb70dd69)

interesting JWT token captured


![image](https://github.com/user-attachments/assets/fa55a851-c363-43e4-8fa2-498e93b27249)


![image](https://github.com/user-attachments/assets/4c69524e-6ce9-4d4f-a5a2-6bb287f23c95)


/tickets page doesnt allow me, says require admin....

According to the html code given, each user is assigned a random guest id and a JWT token is generated. By reading the index.js file , there are ```/``` , ```/tickets``` and ```/submit-ticket``` pages. 
```/``` brings you to home page, ```/tickets``` reuires admin and will display the entire db, ```/submit-ticket``` is the destination of the post request from the site after clicking the submit button. 
When visiting the ```/tickets``` page, the site takes the username (which is given by default) from the cookie and checks if the user is an admin or not. 

1st try changing the cookie, ofc it did not work as the site verified that it was an invalid token. However, with the right secret key, any token is forge-able. By looking at the website's html the section which was [REDACTED] in the given files have been filled in 
```
                const secretKey = await crypto.subtle.importKey(
                    "raw",
                    new TextEncoder().encode("halloween-secret"),
                    { name: "HMAC", hash: "SHA-256" },
                    false,
                    ["sign"],
                );
```

![image](https://github.com/user-attachments/assets/5520787b-d6b7-4630-91c6-f3e2a4d151ef)

![image](https://github.com/user-attachments/assets/a556844a-f572-488b-9ead-bb97a48ec4e6)



After knowing the secret key, the newly baked cookie was used to access the ```/ticket``` page and there was the flag. 




