import base64
import zlib
from io import BytesIO
from deflate import deflate

# Your Base64-encoded string
base64_string = "dY9RS8MwFIX/ynUIyWDKZNkYTjdSW/DFKe3Ux0ttbligpjVtGTL2311a58bA+xIO37nnntwtynUJirSxxFkYYBLFb1HMBsDUB+vPTtHrni3lU9RBbCpyZ44XmSTvz3HoHY+rYKuHE1Q3Y1GWI+FGCoVVqHMxwY2oUA8bqy52ZxGhXMlAJu2RdBwsU6W9Ay4/v6uv3MA9WNpAJ/hf3wGc9GvFoUorDqE+yGjgv2FX86ywlrIaybnC9WELfpQh3nvoiCks6NTkpG6hB9fwz+YMdnBkFdWYrVO3fzlraj31P1jMfwA="

#$compressor = [System.IO.Compression.DeflateStream]::new()

# Decode the Base64 string
#compressed_bytes = base64.b64decode(base64_string)

# Decompress the byte array
#decompressed_bytes = zlib.decompress(compressed_bytes)

# Convert bytes to string
#username = decompressed_bytes.decode('utf-8')


# Decode the stolen base64 data
compressed_bytes = base64.b64decode(base64_string)
# Decompress to get original whoami output
decompressed_bytes = zlib.decompress(compressed_bytes)
# Convert back to readable text
username = decompressed_bytes.decode('utf-8')




# Output the username
print(username)
