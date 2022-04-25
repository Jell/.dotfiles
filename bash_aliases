export ALTERNATE_EDITOR=""
alias emacs='emacsclient -c'

export DOCKER_BUILDKIT=1

alias nats_box="docker run --rm -it --net=host --volume ${PWD}:/root --dns 172.20.0.10 synadia/nats-box"

alias gerp=grep

# kubernetes crap
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# aws crap
complete -C '/usr/local/bin/aws_completer' aws

alias open=xdg-open

source <(arthur completion)

eval "$(direnv hook bash)"
