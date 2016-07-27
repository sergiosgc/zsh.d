# .zsh.d/functions
ZSHD=~/.zsh
if [ ! -e "$ZSHD" ]; then ZSHD=~/.zsh.d; fi

fpath=(${ZSHD}/autocomplete ${ZSHD}/functions $fpath)
for f in ${ZSHD}/autocomplete/*[^~] ${ZSHD}/functions/*[^~]
do
    autoload $f
done
# .zsh.d/env
for env_snipplet in ${ZSHD}/env/*[^~]
do
    export $(basename $env_snipplet)="$(eval "echo $(cat $env_snipplet)")"
done
# Antigen
source ~/.antigen.git/antigen.zsh
antigen use oh-my-zsh
for bundle in ${ZSHD}/antigen_bundles/*[^~]
do
    antigen bundle "$(basename "$bundle" | sed 's/\\/\//')"
done
[ -n "$ZSH_THEME" ] && antigen theme "$ZSH_THEME"
antigen apply
# .zsh.d/rc
for zshrc_snipplet in ${ZSHD}/rc/S[0-9][0-9]*[^~]
do
    source $zshrc_snipplet
done
