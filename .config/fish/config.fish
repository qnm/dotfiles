source ~/.asdf/asdf.fish

fish_add_path ~/.cargo/bin
fish_add_path ~/.gem/ruby/2.6.0/bin

# set DOCKER_HOST unix://$XDG_RUNTIME_DIR/podman/podman.sock

 #>>> conda initialize >>>
 # !! Contents within this block are managed by 'conda init' !!
 eval ~/anaconda3/bin/conda "shell.fish" "hook" $argv | source
 # <<< conda initialize <<<
