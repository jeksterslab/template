#! /usr/bin/bash

mkdir -p ~/.julia
cd ~/.julia
wget -c https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.2-linux-x86_64.tar.gz -O - | tar -xz
mv ~/.julia/julia-1.7.2/* ~/.julia
rm -rf ~/.julia/julia-1.7.2
