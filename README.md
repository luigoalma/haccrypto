# haccrypto

haccrypto is the Nintendo Switch XTSN crypto for Python, originally from ninfs and now standalone.

## Usage

You can import `XTSN` class and `parse_biskeydump` method from `haccrypto.crypto`. `XTSN` requires the crypt key and tweak when declaring an instance of it, it will provide you with the `encrypt` and `decrypt` methods. `parse_biskeydump` will provide you with crypt keys and tweaks from a bis key dump.

### Example usage

```python
# import the crypto module
from haccrypto.crypto import parse_biskeydump, XTSN

# getting your bis keys
# returns a list of 4 lists, each list containing crypt and tweak, for bis keys 0 to 3 
with open("switch-keys.txt", "r") as o:
	bis_keys = parse_biskeydump(o.read())

# lets use bis key 0's crypt and tweak
bis0xtsn = XTSN(bis_keys[0][0], bis_keys[0][1])

# lets see it in action
# lets encrypt a 0 filled buffer of bytes
# and let's say its from sector offset 0, for example sake
# default sector size = 0x200
zeros = b'\0'*32

enc_zeros = bis0xtsn.encrypt(zeros, 0)

# now lets decrypt, got to tell the same sector offset
# internal key and tweak are still the same
dec_zeros = bis0xtsn.decrypt(enc_zeros, 0)

# this should be always true
# otherwise there's something wrong
# that can happen if the openssl dll provided is not proper, or something arbitrary happened
if zeros == dec_zeros:
	print("XTSN ran correctly!")
else:
	print("XTSN has made a bad crypto operation.")
```

# Licenses

* `haccrypto` is under the MIT license.
  * `hac/aes.cpp` and `hac/aes.hpp` are from @openluopworld's [aes_128](https://github.com/openluopworld/aes_128) commit `b5b7f55`, and uses the MIT License.
  * `hac/_crypto.cpp` AES-XTS part by me(@luigoalma), based on @plutooo's [crypto module](https://gist.github.com/plutooo/fd4b22e7f533e780c1759057095d7896).
  * `hac/crypto.py` written by @ihaveamac, falls under MIT license as well.
