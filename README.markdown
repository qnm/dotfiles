# Rob's Dotfiles

This repo is setup to use [Strap](https://github.com/MikeMcQuaid/strap) and [YADM](https://thelocehiliosan.github.io/yadm/).

# Usage

If you're not on MacOS, you'll need to install YADM yourself.

`source <(curl -L bootstrap.yadm.io)` will add a remote YADM to bootstrap if V2 isn't available.

Then it's `yadm clone https://github.com/qnm/dotfiles` and choose to execute the bootstrap.

# Usage with Strap

Open https://macos-strap.herokuapp.com/ in your web browser.

After authorising GitHub for all the repos you wish to use, download and execute the `strap.sh` file.

When prompted, execute the YADM bootstrap to set up Yubikey.

# Update VSCODE
`code --list-extensions > ~/vscode-extensions.txt`
