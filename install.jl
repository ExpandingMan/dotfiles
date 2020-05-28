#!/opt/julia/bin/julia

#====================================================================================================
    This is a simple script for installing my config files

    For now there's almost nothing here, but I may add to this in the future.
====================================================================================================#

const NAMES = (nvim=(".config/nvim/init.vim",),
               alacritty=(".config/alacritty/alacritty.yml",),
               ranger=(".config/ranger/rc.conf", ".config/ranger/scope.sh"),
               i3=(".config/i3/config",),
               julia=(".julia/config/startup.jl",)
              )

function install(fnames, homedir::AbstractString=ENV["HOME"])
    for fname ∈ fnames
        dest = joinpath(homedir, fname)
        @info("installing $fname to $dest")
        cp(joinpath(@__DIR__,fname), dest, force=true, follow_symlinks=true)
    end
end
install(name::Symbol, homedir::AbstractString=ENV["HOME"]) = install(NAMES[name], homedir)
