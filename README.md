# dotfiles

## Applications
Here is a list of some useful applications that I would like to remember exist

### `arandr`
This is pretty crucial for `i3`.  `arandr` is a simple GUI that lets you arrange the layout of your display output and change resolutions.  `arandr` works by
generating a 1-line script containing the necessary `xrandr` command.  To make this script execute whenever `i3` starts you can just put a line in your
`config`.

### `ranger`
This is a simple file browser a bit like from the DOS days.  The main usefulness of this is that you can use it to preview all sorts of things including images
right in the terminal.  Note that you should use the config files found in this repo, and you may need `w3m` installed for previews to work.


## How-To
Here is a list of useful things that I often forget how to do:

- `ldconfig -p`: Lists all libraries in library paths. For example do `ldconfig -p | grep libsdl` to find SDL libraries.
