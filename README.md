# The Python IDE with Vim

The .vimrc maded to write python code.

## Installation

Clone the repo and, after that, just run the install script:

```
$ ./install.sh
```
## Post Installation
After the installation:
- Run vim
- Execute `:PlugInstall`

And that's it.

To get all features working properly make sure you change your terminal font to ``hack`` (installed locally by the install.sh).

On iterm2 (OS X) I use ``Hack 12pt`` as regular font and ``Hack 16pt`` as Non-ASCII fontt (both anti-aliased).

Also make sure you are using ``xterm-256color`` as your ``TERM``. You can do that by adding the following line to your ``~/.bashrc``:

```
export TERM=xterm-256color
```
