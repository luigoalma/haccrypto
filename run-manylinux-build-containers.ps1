#!/usr/bin/env pwsh

Function Run-Container($Version, $Arch) {
    $Platform = "manylinux${Version}_${Arch}";
    $ContainerCommand = ""
    If ($Arch -eq "i686") {
        $ContainerCommand = "linux32";
    }

    $Command = "docker run --rm -e PLAT=$Platform -v `"${PWD}:/haccrypto`" quay.io/pypa/$Platform $ContainerCommand /haccrypto/innerbuild.sh"
    Write-Host "Running: $Command"
    Invoke-Expression "$Command"
}

Run-Container -Version 1 -Arch i686
Run-Container -Version 1 -Arch x86_64

Run-Container -Version 2010 -Arch i686
Run-Container -Version 2010 -Arch x86_64

Run-Container -Version 2014 -Arch i686
Run-Container -Version 2014 -Arch x86_64
Run-Container -Version 2014 -Arch aarch64
Run-Container -Version 2014 -Arch ppc64le
