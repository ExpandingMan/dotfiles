module Installer

const DOTFILES_DIR = joinpath(@__DIR__,"..","..")
const HOME_DIR = ENV["HOME"]

import REPL
using REPL.TerminalMenus
TerminalMenus.config(charset=:unicode)


include("Programs.jl")
using .Programs: Program, Download

name(p::Program{n}) where {n} = n

# TODO should make this better
Base.show(io::IO, p::Program) = print(io, string("Program(",name(p),")"))

srcdstpaths(fname) = (joinpath(DOTFILES_DIR,fname), joinpath(HOME_DIR,fname))

function programs()
    ps = Vector{Program}(undef, 0)
    for n ∈ names(Programs, all=true)
        p = getproperty(Programs, n)
        p isa Program && push!(ps, p)
    end
    ps
end

_shouldwrite(dst) = !isfile(dst) || (request("$dst exists, replace?", RadioMenu(["yes","no"])) == 1)

function diff(src, dst)
    if isfile(dst)
        r = request("$dst exists, replace?", RadioMenu(["yes", "no", "edit diff"]))
        r == 3 && run(`nvim -d $src $dst`)
        return r == 1
    end
    false
end

function installconfigs(p::Program)
    for c ∈ p.configs
        src, dst = srcdstpaths(c)
        if diff(src, dst)
            mkpath(dirname(dst))
            cp(src, dst, force=true, follow_symlinks=true)
            @info("wrote $src to $dst")
        end
    end
end

function Base.download(d::Download)
    dst = joinpath(HOME_DIR, d.dst)
    mkpath(dirname(dst))
    download(d.url, dst)
    d.exe && run(`chmod a+x $dst`)
    @info("downloaded $(d.url) to $dst")
end

function downloads(p::Program)
    for d ∈ p.downloads
        dst = joinpath(HOME_DIR,d.dst)
        _shouldwrite(dst) && download(d)
    end
end

function install(p::Program)
    installconfigs(p)
    downloads(p)
    @info("done with $(name(p)).")
end

function install(progs=programs())
    idx = collect(request("Select programs to install:", MultiSelectMenu(string.(name.(progs)))))
    foreach(install, progs[idx])
end

function help()
    printstyled("Expanding Man's Installer\n", bold=true, color=:blue)
    printstyled("""
    - `help`: this message
    - `install()`: select from a menu of programs
    - `install(p::Program)`: install specific program
    - `Programs`: module containing programs
    - `programs()`: list of programs in `Programs`\n
    """, color=:light_magenta)
end

export help, install, programs, Programs

end # module
