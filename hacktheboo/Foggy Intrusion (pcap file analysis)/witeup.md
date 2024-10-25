![image](https://github.com/user-attachments/assets/3978acad-8bb2-41c4-8cc2-f3159f5da1d1)

starting off with a pcap filled with http and tcp captures......

off to a great start! (sarcasm)

so apparently the server was hacked and this is the capture during the attack?

many http request were responded with 404 not found , however some post request with funny encoded strings had replies of more funny encoded strings (karma)

![image](https://github.com/user-attachments/assets/73d7807a-a278-4ce1-886b-04fbeff7617a)

The http objects were then exported and there were quite some "404 not found"...

after looking through most of then using ```cat * ```

![image](https://github.com/user-attachments/assets/7015e28d-29f2-40e3-a613-3a18e2af1df5)

there were parts like this section where it contained the post data and the server reply

after decrypting the post data , they were mostly malicious shell scripts with a php tag around telling the shell to execute it. 

WITH THE POWER OF AI AND KALI: a python script was born to decode the responds as the usual baase 64 decode does not decode compressed data, the data must first be decompressed 

the process is simply reversing the original powershell script encoding 

>  This script:
> 
> Uses Python's built-in zlib library
> Tries both raw deflate (-15 windowBits) and standard zlib (15 windowBits)
> Handles potential decompression errors
> 
> The windowBits parameter:
> 
> -15: Raw deflate (no wrapper)
> 
> +15: Standard zlib wrapper
> 
> +31: gzip wrapper



after some decoding.....
there is the flagggg

![image](https://github.com/user-attachments/assets/0b49fe2e-902f-43c8-8b95-0045295cce1a)




