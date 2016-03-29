# .zsh.d/functions
fpath=(~/.zsh.d/autocomplete ~/.zsh.d/functions $fpath)
for f in ~/.zsh.d/autocomplete/*[^~] ~/.zsh.d/functions/*[^~]
do
    autoload $f
done
# .zsh.d/env
for env_snipplet in ~/.zsh.d/env/*[^~]
do
    export $(basename $env_snipplet)="$(eval "echo $(cat $env_snipplet)")"
done
# Antigen
source ~/.antigen.git/antigen.zsh
antigen use oh-my-zsh
for bundle in ~/.zsh.d/antigen_bundles/*[^~]
do
    antigen bundle "$(basename "$bundle" | sed 's/\\/\//')"
done
[ -n "$ZSH_THEME" ] && antigen theme "$ZSH_THEME"
antigen apply
# .zsh.d/rc
for zshrc_snipplet in ~/.zsh.d/rc/S[0-9][0-9]*[^~]
do
    source $zshrc_snipplet
done
