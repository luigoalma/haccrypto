#!/bin/bash
set -e -u -x

pyvers=(cp36-cp36m cp37-cp37m cp38-cp38 cp39-cp39 cp310-cp310)

function repair_wheel {
	wheel="$1"
	if ! auditwheel show "$wheel"; then
		echo "Skipping non-platform wheel $wheel"
	else
		auditwheel repair "$wheel" --plat "$PLAT" -w /haccrypto/wheelhouse/
	fi
}

for ver in ${pyvers[@]}; do
	PYBIN=/opt/python/$ver/bin
	"${PYBIN}/pip" wheel /haccrypto/ --no-deps -w wheelhouse/
done

for whl in wheelhouse/*.whl; do
	repair_wheel "$whl"
done
