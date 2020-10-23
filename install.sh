#!/bin/bash
OPTDIR=/opt
JULIA_DIR=$OPTDIR/julia
JULIA=$JULIA_DIR/bin/julia
JULIA_VERSION="1.5.2"
JULIA_DOWNLOAD_URL="https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-$JULIA_VERSION-linux-x86_64.tar.gz"

# can install julia binaries by doint ./install.sh julia
if [[ $1 == "julia" ]]; then
    if [[ "$EUID" != 0 ]]; then
        echo "install.sh: You must be sudo to install julia"
        exit 1
    fi
    echo "---- Installing Julia binaries to $JULIA_DIR ----"
    rm -rf $OPTDIR/julia
    wget $JULIA_DOWNLOAD_URL -O $OPTDIR/julia.tar.gz
    tar xzf $OPTDIR/julia.tar.gz -C $OPTDIR
    mv $OPTDIR/"julia-$JULIA_VERSION" $OPTDIR/julia
    rm $OPTDIR/julia.tar.gz
    echo "---- Julia installed ----"
    exit 0
fi

$JULIA --project=Installer --banner=no --startup-file=no -i -e 'using Installer; help()'
