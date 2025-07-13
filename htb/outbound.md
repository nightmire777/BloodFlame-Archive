> season 8 week 9 ez linux
> I have some hope for this, but it being a sunday, i think i only have less than 5 hours...


<details>
<summary>scan</summary>
  
wut? mail? oh pls no 
  
  ```
  # Nmap 7.95 scan initiated Sun Jul 13 14:44:47 2025 as: /usr/lib/nmap/nmap --privileged -sN -sC -sV -O -v -oN tcp.scan.txt 10.10.11.77
Nmap scan report for 10.10.11.77
Host is up (0.26s latency).
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 9.6p1 Ubuntu 3ubuntu13.12 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 0c:4b:d2:76:ab:10:06:92:05:dc:f7:55:94:7f:18:df (ECDSA)
|_  256 2d:6d:4a:4c:ee:2e:11:b6:c8:90:e6:83:e9:df:38:b0 (ED25519)
80/tcp open  http    nginx 1.24.0 (Ubuntu)
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-title: Did not follow redirect to http://mail.outbound.htb/
|_http-server-header: nginx/1.24.0 (Ubuntu)
Device type: general purpose
Running: Linux 4.X|5.X
OS CPE: cpe:/o:linux:linux_kernel:4 cpe:/o:linux:linux_kernel:5
OS details: Linux 4.15 - 5.19
Uptime guess: 2.894 days (since Thu Jul 10 17:18:30 2025)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=250 (Good luck!)
IP ID Sequence Generation: All zeros
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/share/nmap
OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sun Jul 13 14:45:17 2025 -- 1 IP address (1 host up) scanned in 30.19 seconds
```

</details>

What in the world is roundcube 
<img width="1920" height="907" alt="image" src="https://github.com/user-attachments/assets/22080880-3f07-446d-be66-ecc489ff7b15" />

we cna use a metasploit module to gain a shell, but the user is www-data...
<img width="1920" height="907" alt="image" src="https://github.com/user-attachments/assets/dee1c733-93ba-4e69-8f56-fab46ad3bdef" />
<img width="1920" height="907" alt="image" src="https://github.com/user-attachments/assets/079e52ab-aab9-429d-8589-55bb2337b53e" />


WHAT DA FAQ
<img width="1920" height="907" alt="image" src="https://github.com/user-attachments/assets/97c2871b-2a7a-4084-8d52-487181f7ed34" />

