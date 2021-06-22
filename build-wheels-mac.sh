#!/bin/sh

# Yes this could also work on Linux, but using the manylinux
# images is preferred to make wheels for distribution.

for f in 3.{6,7,8,9}; do
	python$f -m pip wheel ./ --no-deps -w wheelhouse/
done
