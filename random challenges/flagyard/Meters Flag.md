
Here we have a simple UI which kinda works 
![image](https://github.com/user-attachments/assets/b452071b-2683-441d-b9bc-552f0f67cbd8)

However it wont work with any other inputs other than numbers
![image](https://github.com/user-attachments/assets/cdddb0b9-6166-41c4-b4d7-db1d2da1f166)

Here is the burp suite view 
![image](https://github.com/user-attachments/assets/6aece962-c95f-4084-9b90-a1893d8a9c1e)

Welp, the code kinda blocks a certain thing which is the <!DOCTYPE AND <!ENTITY (utf-77 enocded)
![image](https://github.com/user-attachments/assets/213ac47f-6638-4533-98cb-8cae1d6a6740)

However, for whatever reason as seen here, the way cyberchef encodes the payload in UTF7 doesnt seem to clash with the present filter of the code
![image](https://github.com/user-attachments/assets/280bbdec-364c-43b7-be84-0bcca5f8a156)

AND there you have it 
![image](https://github.com/user-attachments/assets/54dfcf06-9feb-4959-8c4f-c8ac64336eab)


![image](https://github.com/user-attachments/assets/d830c654-61c8-44e3-ad43-12cb95f367c6)


> heres a side note...
> I HAVE SPENT COUNTLESS TIMES THINKING MY PAYLOAD WAS THE ISSUE UNTIL I FIGURED I SHOULD TRY ALTERING THE FIELD OF WHICH I PLACE MY XXE (i always placed it in height)
> THEN IT WORKED. ONLY FOR ME TO REALIZED THIS SECTION OF THE CODE
> IF HEIGHT IS 0 IT BECOMES ERROR, WHEN WEIGHT IS 0, IT RETUERNS 0 

```
    height_in_meters = height_float / 100  # Convert height to meters
    return weight_float / (height_in_meters * height_in_meters)
```
add on note


![image](https://github.com/user-attachments/assets/f32e499a-8399-4607-8e8c-a143b5d8e1f5)

