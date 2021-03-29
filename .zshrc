export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim


HISTFILE=/home/rus_og/.config/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt sharehistory
setopt extendedhistory
setopt autocd
xset r rate 200 30
xset b off
setxkbmap -layout us,mk -option 'grp:alt_shift_toggle'
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
prompt redhat 

alias irc='sudo vim ~/.config/i3/config'
alias zrc='sudo vim ~/.zshrc'
alias xrc='vim ~/.xinitrc'
alias prc='vim ~/.config/polybar/config.ini'
alias vrc='sudo vim ~/.vimrc'
alias vw='sudo vim /usr/share/vim/vim82/colors/wal.vim'
alias vo='sudo vim /usr/share/vim/vim82/colors/one.vim'
alias arc='vim ~/.config/alacritty/alacritty.yml'
alias ARC='vim ~/.config/awesome/rc.lua'
alias isrc='vim ~/.i3status.conf'
alias ch='copy ~/suckless/dwm-6.2/config.h .'
alias ibrc='vim ~/.i3blocks.conf'
alias drc='vim ~/suckless/dwm-6.2/config.h'
alias rrc='vim ~/.config/ranger/rc.conf'
alias qrc='vim ~/.config/qutebrowser/config.py'

alias R='ranger'
alias S='startx'
alias B='bluetoothctl'
alias N='neofetch'
alias MD='/home/shaolinrus/suckless/dwm-6.2 && sudo make clean install && cd '
alias ch='cp ~/suckless/dwm-6.2/config.h .'
alias ka='killall'
alias mkt='cp /home/shaolinrus/C/template.c /home/shaolinrus/C/dummy.c'
alias sv='sudo vim'
alias sp='sudo pacman'
alias yeet='sudo pacman -Rnscu'
alias apt='sudo pacman -S'
alias stl='sudo systemctl'
alias ls='exa -F --color=auto --group-directories-first'
alias la='exa -Fa --color=auto --group-directories-first'
alias rp='vim /home/rus_og/raspored'
alias ds='./scripts/spid.sh'
alias ci='cpupower frequency-info | grep policy -A 2'
alias av='arduino --verify'
alias au='arduino --upload'
alias please='sudo'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -iv'
alias hs='history 1'


typeset -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# # Finally, make sure the terminal is in application mode, when zle is
# # active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
 	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
 	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
 	fi

cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
