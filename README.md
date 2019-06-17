# zsh.d
This is my zsh config. There are many like it, but this is one is mine.

Nevertheless, feel free to use it as you wish. You will need to customize it for you. It is designed for this to be easy.

First, edit the zshrc file, find the line that sources antigen and point it to your antigen install path.

Now, move all files in the env, alias, rc and antigen_bundles directories away to a review directory (in your temp path).

Symlink ~/.zshrc to the zshrc file, and restart zsh.

Now, review the files you put away and add them one by one, according to your preference, eventually editing them along the way. Pay special attention to S10_zshopts (which sets all zsh options and thus strongly customizes zsh) and to S40_bindkey which, namely, sets the line editor to vi mode.


