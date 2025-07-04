> silver peas
> password in log files 

```
Host is up (0.21s latency).
Not shown: 997 closed tcp ports (reset)
PORT     STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
8080/tcp open  http-proxy
```

Webpage? 
![image](https://github.com/user-attachments/assets/edb60129-fbe8-4308-be3a-ffab250da5e2)
![image](https://github.com/user-attachments/assets/6c06d169-4a83-4679-88fc-3925a4d53435)

Silver Peas...
![image](https://github.com/user-attachments/assets/2c2b6503-5d2a-459e-a44e-b662b52b462f)


By using CVE-2024-36042 
> removing the password field while logging in as admin (SilverAdmin) , you instantly gain acess

Now one issue remains, why is is thing in spanish???
After some fucking around, i found a set of creds
![image](https://github.com/user-attachments/assets/e905cb92-ca8c-4467-a8f5-f5cec2eee11c)

Well, i guess im tim now 
![image](https://github.com/user-attachments/assets/92a6d606-f1f5-42d1-87ac-713b64c9669a)

tim has adm role, meaning he can see all logs, so we can see what everyone has been doing, and tyler seems to be using docker while also providing a db password...
![image](https://github.com/user-attachments/assets/2e644e32-55a8-49e8-bc71-76dffc6df356)

> I spent so much time here checking logs machien expired lmao

Anyways , i guess im tyler now, and he can sudo, done 
![image](https://github.com/user-attachments/assets/ab04772e-50e4-46a1-b29d-e384d764bd52)






