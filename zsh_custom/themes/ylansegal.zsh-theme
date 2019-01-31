local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='%p\
${ret_status}\
%{$fg[cyan]%}%~ \
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
%B$%b '

ZSH_THEME_GIT_PROMPT_PREFIX="git: %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
