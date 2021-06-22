for %%A in (3.6,3.7,3.8,3.9) do (
	py -%%A-32 -m pip wheel . --no-deps -w wheelhouse
	py -%%A -m pip wheel . --no-deps -w wheelhouse
)
