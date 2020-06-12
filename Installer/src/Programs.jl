module Programs

# TODO should deal with tarballs and such
struct Download
    url::String
    dst::String
    exe::Bool
end

struct Program{name}
    configs::Vector{String}
    downloads::Vector{Download}
    commands::Vector{Cmd}
end

Program(n::Symbol, c, s, d) = Program{n}(c,s,d)

# TODO a lot more obviously needs to be done here for full installs

const zsh = Program(:zsh, [".zshrc"], [], [])

const neovim = Program(:neovim, [".config/nvim/init.vim", ".config/ctags"],
                       [Download("https://github.com/neovim/neovim/"*
                                 "releases/download/nightly/nvim.appimage", "sbin/nvim", true)],
                       [Cmd(`$(joinpath(ENV["HOME"],"sbin","nvim")) +PlugInstall`)]
                      )

const alacritty = Program(:alacritty, [".config/alacritty/alacritty.yml"], [], [])

const ranger = Program(:ranger, [".config/ranger/rc.conf", ".config/ranger/scope.sh"], [], [])

const i3 = Program(:i3, [".config/i3/config"], [], [])

const julia = Program(:julia, [".julia/config/startup.jl"], [], [])


end # module Programs
