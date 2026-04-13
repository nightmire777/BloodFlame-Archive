new platform, time to learn aws vulns

not using headers cuz my 3 key died and i cant type hashtag

url : ```http://flaws.cloud/```

> takeaway

aws has a cli (literally called awscli)

*level 1*

they want us to find subdomain, so someone ran rockyou on them, nothing.

after looking at the hints, we learnt that its an s'three' bucket. These buckets may be accessible using an aws cli

start off by using dig/curl and we find THE IP
![image](https://github.com/user-attachments/assets/ef55defb-a650-4a61-98ba-8290166c14b7)

then, perform a nslookup to confirm its an s'three' bucket 
![image](https://github.com/user-attachments/assets/a53d60cf-4183-4db4-9d0f-4a3986cc2714)

After that comes the AWS part, by using the AWS CLI. Its possible to connect and possibly list and configure? the bucket.

![image](https://github.com/user-attachments/assets/922d41c9-9a85-4f0f-bcb2-f85074401690)

