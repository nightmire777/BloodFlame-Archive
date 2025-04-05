![image](https://github.com/user-attachments/assets/196b0f64-9948-4c94-92b1-668dfe25a2c0)

given a bunch of random files, a shell script and a hash


sha 256 hash : ```5848768e56185707f76c1d74f34f4e03fb0573ecc1ca7b11238007226654bcda```

shell script
```
        #!/bin/bash

        # Check if the user provided a file name as an argument
        if [ $# -eq 0 ]; then
            echo "Expected usage: decrypt.sh <filename>"
            exit 1
        fi

        # Store the provided filename in a variable
        file_name="$1"

        # Check if the provided argument is a file and not a folder
        if [ ! -f "/home/ctf-player/drop-in/$file_name" ]; then
            echo "Error: '$file_name' is not a valid file. Look inside the 'files' folder with 'ls -R'!"
            exit 1
        fi

        # If there's an error reading the file, print an error message
        if ! openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -salt -in "/home/ctf-player/drop-in/$file_name" -k picoCTF; then
            echo "Error: Failed to decrypt '$file_name'. This flag is fake! Keep looking!"
        fi
        
```


first need to hash all the files and find the file that has a hash that matches the given one 
the files/* means to hash all the files in the folder named files 
```sha256sum files/* | grep "5848768e56185707f76c1d74f34f4e03fb0573ecc1ca7b11238007226654bcda"```


The command returned 1 file, which was a binary file, infact the only binarry file i think....

![image](https://github.com/user-attachments/assets/ad16128b-f407-49db-a1f4-5d187a353e0c)

then run the shell script given and replace the directories accordingly and the flag will be printed 

```
./decrypt.sh 8eee7195
picoCTF{trust_but_verify_8eee7195}

```

