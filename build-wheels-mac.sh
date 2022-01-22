#!/bin/sh

# Yes this could also work on Linux, but using the manylinux
# images is preferred to make wheels for distribution.

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 [python-versions]"
	echo "e.g. $0 3.6 3.7 3.8 3.9 3.10"
	echo "Alternate: $0 3.{6,7,8,9,10}"
	echo
	echo "Recommended for release:"
	echo "  Intel:         $0 3.{6,7,8,9}"
	echo "  Apple Silicon: $0 3.{8,9,10}"
	exit 1
fi

for f in "$@"; do
	python$f -m pip wheel ./ --no-deps -w wheelhouse/
done
