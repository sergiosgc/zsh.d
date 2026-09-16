ZSHD=~/.zsh.d
fpath=(${ZSHD}/autocomplete ${ZSHD}/functions $fpath)
for env_snippet in ${ZSHD}/env/*[^~]
do
    export $(basename $env_snippet)="$(eval "echo $(cat $env_snippet)")"
done
source ${ZSHD}/antigen.zsh
antigen init ${ZSHD}/antigenrc
for bundle in ${ZSHD}/antigen_bundles/*[^~]
do
    antigen bundle "$(basename "$bundle" | sed 's/\\/\//')"
done
[ -n "$ZSH_THEME" ] && antigen theme "$ZSH_THEME"
antigen apply

for zshrc_snippet in ${ZSHD}/rc/S[0-9][0-9]*[^~]
do
    source $zshrc_snippet
done
for alias_snippet in ${ZSHD}/alias/*[^~]
do
    alias $(basename $alias_snippet)="$(cat $alias_snippet)"
done

export PATH="$PATH:/home/sergio/.local/bin"
