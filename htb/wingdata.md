> s10 ez linux

Empty NMAP with a http site: <details><summary>NMAP</summary>

```

```


</details>


In there lies a ftp site, after clicking around, a login portal for WingFTP is found. Version stated clearly as well =) By pulling a quick RCE, we have shell access as a user named wingdata

<img width="698" height="475" alt="image" src="https://github.com/user-attachments/assets/7ed3aed1-bebb-418f-956f-8b2ea5e56964" />
POC
<img width="1153" height="443" alt="image" src="https://github.com/user-attachments/assets/e04abbb2-d535-4e35-84b4-d562122ee035" />
Shell Access

Exploring all the server files: 
The machine has 2 users: wingdata and wacky
The ftp server has 5 users and a admin:
```
wacky 32940defd3c3ef70a2dd44a5301ff984c4742f0baae76ff5b8783994f8a503ca
steve 5916c7481fa2f20bd86f4bdb900f0342359ec19a77b7e3ae118f3b5d0d3334ca
maria a70221f33a51dca76dfd46c17ab17116a97823caf40aeecfbc611cae47421b03
john c1f14672feec3bba27231048271fcdcddeb9d75ef79f6889139aa78c9d398f10
anonymous d67f86152e5c4df1b0ac4a18d3ca4a89c1b12e6b748ed71d01aeb92341927bca
admin a8339f8e4465a9c47158394d8efe7cc45a5f361ab983844c8562bef2193bafba
```
WingFTP hashes their passwords with a salt, the default one however is "WingFTP". It was confirmed in one of the many settings.xml. 
Using the salt, the password for wacky was cracked 
<img width="698" height="475" alt="image" src="https://github.com/user-attachments/assets/41c3174a-8c2e-40c5-8962-ea7b4ae66864" />
<img width="977" height="353" alt="image" src="https://github.com/user-attachments/assets/a93a2b75-0d1b-4531-a3d8-f9547b3dfb10" />

