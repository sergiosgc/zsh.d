export ZSH=~/.antigen/bundles/robbyrussell/oh-my-zsh
# .zsh.d/functions
ZSHD=~/.zsh
if [ ! -e "$ZSHD" ]; then ZSHD=~/.zsh.d; fi

fpath=(${ZSHD}/autocomplete ${ZSHD}/functions $fpath)
for f in ${ZSHD}/autocomplete/*[^~] ${ZSHD}/functions/*[^~]
do
    autoload $f
done
# .zsh.d/env
for env_snippet in ${ZSHD}/env/*[^~]
do
    export $(basename $env_snippet)="$(eval "echo $(cat $env_snippet)")"
done
# .zsh.d/alias
for alias_snippet in ${ZSHD}/alias/*[^~]
do
    alias $(basename $alias_snippet)="$(cat $alias_snippet)"
done
# Antigen
if [ -f ~/.antigen.git/antigen.zsh ]
then
    source ~/.antigen.git/antigen.zsh
else
    source /usr/share/zsh-antigen/antigen.zsh
fi
antigen use oh-my-zsh
for bundle in ${ZSHD}/antigen_bundles/*[^~]
do
    antigen bundle "$(basename "$bundle" | sed 's/\\/\//')"
done
[ -n "$ZSH_THEME" ] && antigen theme "$ZSH_THEME"
antigen apply
# .zsh.d/rc
for zshrc_snippet in ${ZSHD}/rc/S[0-9][0-9]*[^~]
do
    source $zshrc_snippet
done
