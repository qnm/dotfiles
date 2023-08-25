{
  username,
  config,
  pkgs,
  nixpkgs,
  ...
}:
let
  homeDir = if pkgs.stdenv.isDarwin then "Users" else "home";
  user = "qnm";
in
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba";
    };

    "org/gnome/desktop/input-sources" = { xkb-options = [ "ctrl:nocaps" ]; };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = user;
  home.homeDirectory = "/${homeDir}/${user}";

  # system.keyboard.remapCapsLockToControl = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # dotenv
    # docker
    docker-compose
    shadowenv
    neofetch
    gh
    ripgrep
    curl
    unzip
    tmux
    terraform
    terraformer
    awscli2
    ssm-session-manager-plugin
    asdf-vm
    adrgen
    hasura-cli
    google-cloud-sdk
    copilot-cli
    yadm
    jq
    wget
    gnupg
    alacritty
    yadm
    graphviz
  ] ++ (lib.optionals pkgs.stdenv.isDarwin [
      # macos only
      iterm2
  ]) ++ (lib.optionals pkgs.stdenv.isLinux [
      # linux only
      firefox
      flatpak
      gnome.gnome-tweaks
      gnome.gnome-keyring
      gnome.gnome-screenshot
      gnome.nautilus
      gnome.gnome-shell-extensions
      gnomeExtensions.appindicator
      gnomeExtensions.pop-shell
      rocminfo
      tidal-hifi
      shortwave
  ]);

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/qnm/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
      };
    };
    languages = {
      language = [
        {
          name = "ruby";
          config = {
            solargraph = {
              diagnostics = true;
              formatting = true;
            };
          };
        }
        {
          name = "tsx";
          formatter= {
            command = "cd $FILE_LOCATION && prettier";
            args = [
              "--config-precedence"
              "prefer-file"
              "--stdin-filepath"
              "file.tsx"
            ];
          };
        }
        {
          name = "javascript";
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "typescript"
            ];
          };
          auto-format = true;
        }
      ];
    };
    themes = {
      catpuccin_mocha_test = let
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
      in {
        "type" = yellow;
      };
    };
  };

  # Enable zsh
  programs.zsh = {
    enable = true;
    # syntaxHighlighting.enable = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    shellAliases = {
      ll = "ls -l";
      nix-update = "nix run nixpkgs#home-manager -- switch --flake ~/.config/home-manager/ -b backup";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "bundler"
        "dotenv"
        "asdf"
        "rake"
        "rbenv"
        "ruby"
        "zsh-autosuggestions"
      ];
      theme = "robbyrussell";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraConfig = ''
      set modeline
      set number " turn on line numbers

      " 80-col highlighting
      highlight OverLength ctermbg=red ctermfg=white guibg=#592929
      match OverLength /\%81v.\+/
      set colorcolumn=80

      " Identation
      set autoindent " Copy indent from current line when starting a new line
      set smarttab
      set tabstop=2 " Number of space og a <Tab> character
      set softtabstop=2
      set shiftwidth=2 " Number of spaces use by autoindent
      set expandtab " Pressing <Tab> puts spaces, and < and > for indenting uses psaces
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = ctrlp;
        config = ''
          let g:ctrlp_map = '<c-p>'
          let g:ctrlp_cmd = 'CtrlP'
          let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
        '';
      }
      {
        plugin = catppuccin-nvim;
        config = ''
          " theme
          syntax enable
          set background=dark
          colorscheme catppuccin-mocha
          set termguicolors
        '';
      }
      {
        plugin = coc-nvim;
        config = ''
          let g:coc_global_extensions = ['coc-solargraph']
          
          inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
          inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
          
          function! s:check_back_space() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
          endfunction

          " Use <c-space> to trigger completion.
          if has('nvim')
            inoremap <silent><expr> <c-space> coc#refresh()
          else
            inoremap <silent><expr> <c-@> coc#refresh()
          endif
          
          " Follow definition
          nmap <silent> gd <Plug>(coc-definition)

        '';
      }
      lightline-vim
      coc-solargraph
      coc-tsserver
      coc-json
    ];

    extraPackages = with pkgs; [ fzf ];
    extraPython3Packages = ps: with ps; [ /* python-language-server */ ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
