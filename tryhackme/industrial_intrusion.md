> Gonna try this format of documentation by titling all the challenges, hopefully it looks good


Task 28 - Start 
=
Ill be honest i have no idea, i just did an nmap scan and got it, i guess its called start for a reason 

```
nmap 10.10.161.240 -p 9008 -sC -sV -O -T1 -v
Starting Nmap 7.95 ( https://nmap.org ) at 2025-06-27 01:44 EDT
NSE: Loaded 157 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 01:44
Completed NSE at 01:44, 0.00s elapsed
Initiating NSE at 01:44
Completed NSE at 01:44, 0.00s elapsed
Initiating NSE at 01:44
Completed NSE at 01:44, 0.00s elapsed
Initiating Ping Scan at 01:44
Scanning 10.10.161.240 [4 ports]
Completed Ping Scan at 01:44, 15.22s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 01:44
Completed Parallel DNS resolution of 1 host. at 01:44, 0.02s elapsed
Initiating SYN Stealth Scan at 01:44
Scanning 10.10.161.240 [1 port]
Discovered open port 9008/tcp on 10.10.161.240
Completed SYN Stealth Scan at 01:45, 15.22s elapsed (1 total ports)
Initiating Service scan at 01:45
Scanning 1 service on 10.10.161.240
Completed Service scan at 01:46, 98.39s elapsed (1 service on 1 host)
Initiating OS detection (try #1) against 10.10.161.240
Retrying OS detection (try #2) against 10.10.161.240
NSE: Script scanning 10.10.161.240.
Initiating NSE at 01:58
Stats: 0:14:12 elapsed; 0 hosts completed (1 up), 1 undergoing Script Scan
NSE: Active NSE Script Threads: 148 (0 waiting)
NSE Timing: About 0.00% done
Completed NSE at 01:58, 0.43s elapsed
Initiating NSE at 01:58
Completed NSE at 01:58, 10.44s elapsed
Initiating NSE at 01:58
Completed NSE at 01:58, 0.00s elapsed
Nmap scan report for 10.10.161.240
Host is up (0.21s latency).

PORT     STATE SERVICE     VERSION
9008/tcp open  ogs-server?
| fingerprint-strings: 
|   DNSStatusRequestTCP, DNSVersionBindReqTCP, JavaRMI, LANDesk-RC, LDAPBindReq, NCP, NULL, NotesRPC, RPCCheck, SMBProgNeg, TerminalServer, WMSRequest, X11Probe, afp, giop, ms-sql-s, oracle-tns: 
|     Enter your username:
|   FourOhFourRequest, SSLSessionReq, TLSSessionReq: 
|     Enter your username: Welcome, admin!
|     THM{nice_place_t0_st4rt}
|   GenericLines, GetRequest, Help, Kerberos, LDAPSearchReq, LPDString, SIPOptions: 
|_    Enter your username: Access denied.
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port9008-TCP:V=7.95%I=7%D=6/27%Time=685E2FE4%P=x86_64-pc-linux-gnu%r(NU
SF:LL,15,"Enter\x20your\x20username:\x20")%r(GenericLines,24,"Enter\x20you
SF:r\x20username:\x20Access\x20denied\.\n")%r(GetRequest,24,"Enter\x20your
SF:\x20username:\x20Access\x20denied\.\n")%r(RPCCheck,15,"Enter\x20your\x2
SF:0username:\x20")%r(DNSVersionBindReqTCP,15,"Enter\x20your\x20username:\
SF:x20")%r(DNSStatusRequestTCP,15,"Enter\x20your\x20username:\x20")%r(Help
SF:,24,"Enter\x20your\x20username:\x20Access\x20denied\.\n")%r(SSLSessionR
SF:eq,3F,"Enter\x20your\x20username:\x20Welcome,\x20admin!\nTHM{nice_place
SF:_t0_st4rt}\n\n")%r(TLSSessionReq,3F,"Enter\x20your\x20username:\x20Welc
SF:ome,\x20admin!\nTHM{nice_place_t0_st4rt}\n\n")%r(Kerberos,24,"Enter\x20
SF:your\x20username:\x20Access\x20denied\.\n")%r(SMBProgNeg,15,"Enter\x20y
SF:our\x20username:\x20")%r(X11Probe,15,"Enter\x20your\x20username:\x20")%
SF:r(FourOhFourRequest,3F,"Enter\x20your\x20username:\x20Welcome,\x20admin
SF:!\nTHM{nice_place_t0_st4rt}\n\n")%r(LPDString,24,"Enter\x20your\x20user
SF:name:\x20Access\x20denied\.\n")%r(LDAPSearchReq,24,"Enter\x20your\x20us
SF:ername:\x20Access\x20denied\.\n")%r(LDAPBindReq,15,"Enter\x20your\x20us
SF:ername:\x20")%r(SIPOptions,24,"Enter\x20your\x20username:\x20Access\x20
SF:denied\.\n")%r(LANDesk-RC,15,"Enter\x20your\x20username:\x20")%r(Termin
SF:alServer,15,"Enter\x20your\x20username:\x20")%r(NCP,15,"Enter\x20your\x
SF:20username:\x20")%r(NotesRPC,15,"Enter\x20your\x20username:\x20")%r(Jav
SF:aRMI,15,"Enter\x20your\x20username:\x20")%r(WMSRequest,15,"Enter\x20you
SF:r\x20username:\x20")%r(oracle-tns,15,"Enter\x20your\x20username:\x20")%
SF:r(ms-sql-s,15,"Enter\x20your\x20username:\x20")%r(afp,15,"Enter\x20your
SF:\x20username:\x20")%r(giop,15,"Enter\x20your\x20username:\x20");
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Aggressive OS guesses: Linux 4.15 - 5.19 (96%), Linux 5.10 (94%), Linux 5.0 - 5.14 (94%), Linux 4.15 (93%), Linux 3.2 - 4.14 (93%), Linux 2.6.32 - 3.10 (93%), OpenWrt 21.02 (Linux 5.4) (92%), Linux 6.0 (92%), MikroTik RouterOS 7.2 - 7.5 (Linux 5.6.3) (92%), Linux 3.3 (92%)
No exact OS matches for host (test conditions non-ideal).
Uptime guess: 47.161 days (since Sat May 10 22:07:07 2025)
Network Distance: 2 hops
TCP Sequence Prediction: Difficulty=0 (Trivial joke)
IP ID Sequence Generation: All zeros

NSE: Script Post-scanning.
Initiating NSE at 01:58
Completed NSE at 01:58, 0.00s elapsed
Initiating NSE at 01:58
Completed NSE at 01:58, 0.00s elapsed
Initiating NSE at 01:58
Completed NSE at 01:58, 0.00s elapsed
Read data files from: /usr/share/nmap
OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 863.49 seconds
           Raw packets sent: 49 (3.800KB) | Rcvd: 34 (2.811KB)

```


