# This file is a part of haccrypto.
#
# Copyright (c) 2017-2020 Ian Burgwin
# This file is licensed under The MIT License (MIT).
# You can find the full license text in LICENSE.md in the root of this project.

class XTSN:
	def __init__(self, crypt: bytes, tweak: bytes): ...

	def decrypt(self, buf: bytes, sector_offset: int, sector_size: int = 0x200,
		skipped_bytes: int = 0) -> bytes: ...

	def encrypt(self, buf: bytes, sector_offset: int, sector_size: int = 0x200,
		skipped_bytes: int = 0) -> bytes: ...
