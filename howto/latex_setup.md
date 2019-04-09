# LateX Setup
See [this](https://castel.dev/post/lecture-notes-1/) extremely helpful blog post for some clever ways of setting up LaTeX in vim.

[This](https://wikimatze.de/vimtex-the-perfect-tool-for-working-with-tex-and-vim/) post gives a bit of info on setting up `vimtex`.

Note that one must install `latexmk` for continuous compilation.

You can initiate compilation with `\ll` and view the file with `\lv`.  See `:help vimtex` for more.

## Changin Margins (with little effort)
Note that the `fullpage` package is deprecated, and often won't be found.  Alternatively, you can use the `geometry` package.  For example, a good alternative
to `fullpage` is
```latex
\usepackage[margin=2.5cm]{geometry}
```
