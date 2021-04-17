
alias nats_box="docker run --rm -it --net=host synadia/nats-box"

alias gerp=grep

# kubernetes crap
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

source <(arthur completion)
