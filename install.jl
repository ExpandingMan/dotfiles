#!/opt/julia/bin/julia

#====================================================================================================
    This is a simple script for installing my config files

    For now there's almost nothing here, but I may add to this in the future.
====================================================================================================#

const NAMES = (nvim=".config/nvim/init.vim",
               alacritty=".config/alacritty/alacritty.yml",
               i3=".config/i3/config")

function install(fname::AbstractString, homedir::AbstractString=ENV["HOME"])
    dest = joinpath(homedir, fname)
    @info("installing $fname to $dest")
    cp(joinpath(@__DIR__,fname), dest, force=true, follow_symlinks=true)
end
install(name::Symbol, homedir::AbstractString=ENV["HOME"]) = install(NAMES[name], homedir)
