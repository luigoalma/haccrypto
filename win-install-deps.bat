for %%A in (3.6,3.7,3.8,3.9) do (
	py -%%A-32 -m pip install --upgrade pip wheel
	py -%%A -m pip install --upgrade pip wheel
)
