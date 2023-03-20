source ~/.asdf/asdf.fish

fish_add_path /home/qnm/.cargo/bin
fish_add_path /home/qnm/.gem/ruby/2.6.0/bin

set DOCKER_HOST unix://$XDG_RUNTIME_DIR/podman/podman.sock
