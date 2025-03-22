> Server side template injection
> Mainly used on python web servers which render template
> injects malicious code into the template 


![image](https://github.com/user-attachments/assets/60163473-6ed8-4442-8022-7c3a68a6dbc1)
![image](https://github.com/user-attachments/assets/30d058a5-cf52-4a91-a8e1-ba13e75ab2ee)


Announcement website, COOL

ITS TIME TO ANNOUNCE THAT IM GA...


So now we announce that 60 + 9 is 

69 

NICE

This confirms the vulnerability, Server side template injection. Which also is literlly the hint.

![image](https://github.com/user-attachments/assets/9e8b5a4c-03e4-43ac-a707-9b05dcc69611)
![image](https://github.com/user-attachments/assets/6baa1558-8716-4d86-be16-18469ac0b609)

Heres some code thats not mine, but i know it allows to run any shell commands 

```{{config.__class__.__init__.__globals__['os'].popen('ls').read()}}```
![image](https://github.com/user-attachments/assets/1832d8e9-5f34-403c-a26c-94be10fa72c3)

and now we just cat that file and done ! 

![image](https://github.com/user-attachments/assets/17f52e53-6760-4834-818e-6e3d82d8d416)
