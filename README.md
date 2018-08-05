# dotfiles
The intention is to make it pretty easy to reproduce my linux installs with only what is in this repository.

## Distro
I've very quickly come to prefer Manjaro for a number of reasons, in particular that it seems to have amazingly worry-free hardware setup even for nVidia.
Historically I've used Ubuntu quite a lot, but lately am getting rather fed up with the update model among other things.

For the most part everything described here should be more-or-less distro agnostic, but it'll probably be easiest on Arch branches.  Currently the one known
major headache on Ubuntu is that on Ubuntu one has to compile `polybar`.  This is a big pain because `polybar` depends on `libxcb` and in the Ubuntu repos that
library is split into about a billion different packages, so you'll be spending a good amount of time figuring out which ones you need.

## Applications
Here is a list of some useful applications that I would like to remember exist

### `arandr`
This is pretty crucial for `i3`.  `arandr` is a simple GUI that lets you arrange the layout of your display output and change resolutions.  `arandr` works by
generating a 1-line script containing the necessary `xrandr` command.  To make this script execute whenever `i3` starts you can just put a line in your
`config`.

### `ranger`
This is a simple file browser a bit like from the DOS days.  The main usefulness of this is that you can use it to preview all sorts of things including images
right in the terminal.  Note that you should use the config files found in this repo, and you may need `w3m` installed for previews to work.

### `nmcli`
This is a command line interface for the network manager.  Note also that `nmtui` opens a little DOS-like menu that lets you open connections to new wifi
networks.  Typically I will use `nmcli` to manage my wifi, e.g. `nmcli connection up tristero5`.

### `scrot`
This is a nice utility for taking screenshots.  Note that my `i3` keybindings for this by default are `Print` for taking a full screenshot, `$mod+Print` for
just the current window, and `Shift+Print` for a little box that you can select with the mouse.  The output will be put in `~/Pictures/screenshots`.

### `amixer`
This is for controlling audio output, usually the OS will use this by default.  I need to make keybindings within `i3` at some point. In the meantime, you can
increase or decrease volume with `amixer set Master x%±`.

### `mps-youtube`
Binary called `mpsyt`, this is a nice way of browsing YouTube from the command line and watching videos with VLC or another player.


### Required
The following are required for my default setup
- `i3-gaps` (equivalently `i3` should work just fine)
- `polybar`
- `dmenu_recency` (alternatively `dmenu` is fine, but be sure to change `i3` config)
- `feh`
- `ttf-font-awesome` (these are icon fonts used by the `polybar`)
- `nvim` (my default editor I use for everything)

## Directory Structure
Currently the only non-standard directories that will be expected by something are
- `~/Pictures/backgrounds/` (by `feh` for backgrounds)
- `~/Pictures/screenshots/` (by `scrot` for screenshots)


## Colors
Currently I'm using the [dracula](https://github.com/dracula/dracula-theme) everywhere mostly because it's *unbelievably well-supported* and, unlike many color
schemes, actually has good enough contrast for me to be happy with it in vim.  I'd basically describe it as "neon that doesn't look too 80's".  The dracula
colors are currently hard-coded into my `init.vim` (via the `dracula.vim` package), `i3/config` and `polybar/config`, which is certainly not ideal.  The only
place a user would need to change the colors manually is on the terminal itself.  Since I use `gnome-terminal`, one can use
[dracula/gnome-terminal](https://github.com/dracula/gnome-terminal).

### Backgrounds
It is expected that you keep your backgrounds in `$HOME/Pictures/backgrounds`.  The `.fehbg` will randomly assign them when the session starts (called by `i3`).
I like to use a huge number of different backgrounds, the only rule is that they all be somehow "sci-fi" themed (especially spaceships!).

### Future Plans
The current situation with the colors is highly unsatisfactory.  There are some nice tools for assigning colors using images as references using clustering of
the pixels such as [pywal](https://github.com/dylanarapas/pywal) but frankly the results don't often look very nice, especially for doing real work.  At some
point I'm going to carefully create my own color scheme (I've found that this is much harder than it sounds).  I will fork the aforementioned dracula repos and
insert my colors.  Hopefully I will come up with some way to clean up the process a bit when I do so.

My new colors will probably be some sort of bluish think with cyan and orange highlights.


## Julia
I use [Julia](https://julialang.org) extensively, in the long run I expect it to be much more intimately intertwined with this setup.  Note that for now the
Julia binaries are expected to be in `/opt/julia/bin` (at some point I will have more permanent system-wide environment variables).  You can use `$mod+F1` to
launch a new Julia REPL.


## How-To
Here is a list of useful things that I often forget how to do:

- `ldconfig -p`: Lists all libraries in library paths. For example do `ldconfig -p | grep libsdl` to find SDL libraries.
