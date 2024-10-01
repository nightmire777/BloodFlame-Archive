 # i know i will need this in the future for whatever reson (most prolly cuz i forgot hwo to use tshark)


![image](https://github.com/user-attachments/assets/7fe9734a-7007-4e76-9e4d-db22b7be5b36)

you get a pcap file in the link...

![image](https://github.com/user-attachments/assets/453d3559-1888-4a78-a3b9-c37bde26b95a)
![image](https://github.com/user-attachments/assets/7c663b86-9fbf-4306-a59b-a8a0e3e48b3e)


in the pcap file, looks like someone was trying really hard to query somehting, nothing much to export either, all text files...

The challenege title states an image, and the queries look sus 

time to bing up wireshark's GUI-less brother, tshark

![image](https://github.com/user-attachments/assets/1bd80bf3-0bb4-43cc-95d2-ba6ae74aea45)
![image](https://github.com/user-attachments/assets/30a16ce1-8320-461f-a558-6c34d868a3e2)


its quite clear the links have something as the ending has a = which usually means smr like base 64 

then using the command

```
tshark -r challenge.pcap -Y "dns.qry.name" -T fields -e dns.qry.name > tsharkk.txt
```

It lets tshark read the pcap file in a certain way and write the output into tsharkk.txt
# Parameters 

```-r``` : used to specify which file to read (in this case challenge.pcap)
```-Y``` : used to filter what type of packet to display (in this case only the dns queries)
```-T``` : specify tshark to display only certain fields 
```-e``` : specifies what fields to output (in this case the dns query name)

the part after that is to write the output into a file named tsharkk.txt

so the output looks smt like this 
![image](https://github.com/user-attachments/assets/e10ed46f-0c40-449b-96e3-82129d789f66)


then, a python script was used to remove the extra parts of the data (could have used some online websites....)
```
F = open("tsharkk.txt")
for line in F :
    linee = line.replace(".gdsc.com","")
    print(linee, end ='')
```

the output of the python script was then stored in a text file and sent to the [kitchen](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://gchq.github.io/CyberChef/&ved=2ahUKEwj8qOLz7eyIAxUBRmwGHXjRJ4QQFnoECAoQAQ&usg=AOvVaw3cJhXGWs_4gKkmjmhQLSNC)
![image](https://github.com/user-attachments/assets/10b1e464-b37f-4dd8-b792-bcd862d6ac7d)

as the chefs cook, the image shows itself

![image](https://github.com/user-attachments/assets/21b966a0-ddbf-42ea-b2fa-c66753e42eca)


