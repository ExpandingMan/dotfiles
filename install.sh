#!/bin/bash
JULIA=/opt/julia/bin/julia
$JULIA --project=Installer --banner=no --startup-file=no -i -e 'using Installer; help()'
