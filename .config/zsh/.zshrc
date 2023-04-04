TERM=xterm-256color

PROMPT="$ "
ZSH_THEME="ys"

setopt autocd

alias vim="nvim"
alias vi=vim

alias pullmp3="youtube-dl -x --audio-format mp3 -f bestaudio --embed-thumbnail -o '~/Music/unsorted/%(title)s.%(ext)s'"

#img2gif () {
#	ffmpeg -framerate 30 -pattern_type glob -i '*.png' \
#  -i audio.ogg -c:a copy -shortest -c:v libx264 -pix_fmt yuv420p out.mp4
#}

alias qr="qrencode -t utf8i"

# Init with tmux on
alias tm="tmux attach || tmux new"

alias vs="code"

alias resetaudio="sudo killall coreaudiod"

export PATH="$PATH:/Users/system/.foundry/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
