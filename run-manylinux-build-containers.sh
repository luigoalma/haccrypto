#!/bin/sh
set -e

function run_container {
	ver="$1"
	arch="$2"

	PLAT="manylinux${ver}_${arch}"
	CMD=""
	if [ $arch = i686 ]; then
		CMD="linux32"
	fi

	docker run --rm -e PLAT=$PLAT -v `pwd`:/haccrypto quay.io/pypa/$PLAT $CMD /haccrypto/innerbuild.sh
}

run_container 1 i686
run_container 1 x86_64

run_container 2010 i686
run_container 2010 x86_64

run_container 2014 i686
run_container 2014 x86_64
run_container 2014 aarch64
run_container 2014 ppc64le
