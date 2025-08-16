> 


welp here i go again procrastinating on assignents while playing this H game 

<details>
<summary>Nmap scan</summary>
  
```
# Nmap 7.95 scan initiated Sun Aug  3 16:41:16 2025 as: /usr/lib/nmap/nmap --privileged -sC -sV -O -v -oN tcp_scan.txt 10.10.11.80
Increasing send delay for 10.10.11.80 from 0 to 5 due to 181 out of 601 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 5 to 10 due to 18 out of 59 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 10 to 20 due to 11 out of 35 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 20 to 40 due to 11 out of 18 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 40 to 80 due to 11 out of 12 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 80 to 160 due to 11 out of 13 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 160 to 320 due to 11 out of 14 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 320 to 640 due to 11 out of 11 dropped probes since last increase.
Increasing send delay for 10.10.11.80 from 640 to 1000 due to 11 out of 12 dropped probes since last increase.
Nmap scan report for editor.htb (10.10.11.80)
Host is up (0.32s latency).
Not shown: 996 closed tcp ports (reset)
PORT     STATE SERVICE   VERSION
22/tcp   open  ssh       OpenSSH 8.9p1 Ubuntu 3ubuntu0.13 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 3e:ea:45:4b:c5:d1:6d:6f:e2:d4:d1:3b:0a:3d:a9:4f (ECDSA)
|_  256 64:cc:75:de:4a:e6:a5:b4:73:eb:3f:1b:cf:b4:e3:94 (ED25519)
80/tcp   open  http      nginx 1.18.0 (Ubuntu)
|_http-server-header: nginx/1.18.0 (Ubuntu)
| http-methods: 
|_  Supported Methods: GET HEAD
|_http-title: Editor - SimplistCode Pro
8000/tcp open  http-alt?
8080/tcp open  http      Jetty 10.0.20
| http-webdav-scan: 
|   Server Type: Jetty(10.0.20)
|   WebDAV type: Unknown
|_  Allowed Methods: OPTIONS, GET, HEAD, PROPFIND, LOCK, UNLOCK
|_http-open-proxy: Proxy might be redirecting requests
| http-robots.txt: 50 disallowed entries (15 shown)
| /xwiki/bin/viewattachrev/ /xwiki/bin/viewrev/ 
| /xwiki/bin/pdf/ /xwiki/bin/edit/ /xwiki/bin/create/ 
| /xwiki/bin/inline/ /xwiki/bin/preview/ /xwiki/bin/save/ 
| /xwiki/bin/saveandcontinue/ /xwiki/bin/rollback/ /xwiki/bin/deleteversions/ 
| /xwiki/bin/cancel/ /xwiki/bin/delete/ /xwiki/bin/deletespace/ 
|_/xwiki/bin/undelete/
| http-methods: 
|   Supported Methods: OPTIONS GET HEAD PROPFIND LOCK UNLOCK
|_  Potentially risky methods: PROPFIND LOCK UNLOCK
| http-cookie-flags: 
|   /: 
|     JSESSIONID: 
|_      httponly flag not set
| http-title: XWiki - Main - Intro
|_Requested resource was http://editor.htb:8080/xwiki/bin/view/Main/
|_http-server-header: Jetty(10.0.20)
Device type: general purpose|router
Running: Linux 4.X|5.X, MikroTik RouterOS 7.X
OS CPE: cpe:/o:linux:linux_kernel:4 cpe:/o:linux:linux_kernel:5 cpe:/o:mikrotik:routeros:7 cpe:/o:linux:linux_kernel:5.6.3
OS details: Linux 4.15 - 5.19, MikroTik RouterOS 7.2 - 7.5 (Linux 5.6.3)
Uptime guess: 7.110 days (since Sun Jul 27 14:10:24 2025)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=259 (Good luck!)
IP ID Sequence Generation: All zeros
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/share/nmap
OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sun Aug  3 16:48:22 2025 -- 1 IP address (1 host up) scanned in 426.21 seconds

```

</detail>
