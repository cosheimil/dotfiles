{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "artem";
  home.homeDirectory = "/home/artem";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.sessionPath = [ "$HOME/.local/bin" ];

  # Fonts working
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # GTK Themes and more ...
    gruvbox-dark-gtk
    gruvbox-dark-icons-gtk
    lxappearance
    capitaine-cursors
    capitaine-cursors-themed

    # Terminal and more
    kitty
    zsh
    xclip
    neofetch
    btop 
    arandr
    conky
    feh
    gnupg
    pass
    passff-host
    qtpass
    unzip
      
    # Dev
    neovim
    lapce
    trunk-io
    poetry
    gh
    joshuto
    direnv
    obsidian
    xclip
    ruff
    rustup
    gcc
    qalculate-qt
    
    # Window Managers
    qtile
    awesome
    dunst
    rofi
    rofi-calc
    rofi-pass
    rofi-power-menu
    nitrogen
    haskellPackages.iwlib
    brightnessctl
    maim

    # Qtile deps
    python3Packages.keyring
    python3Packages.xcffib
    # python3Packages.cairocffi-xcffib
    python3Packages.setuptools
    python3Packages.setuptools_scm
    python3Packages.dateutil
    python3Packages.dbus-python
    python3Packages.mpd2
    python3Packages.psutil
    python3Packages.pyxdg
    python3Packages.pygobject3
    python3Packages.dbus-next
    kbdd

    # Graphics
    flameshot
    vlc

    # Files
    xfce.thunar
    xfce.thunar-volman
    pcmanfm
    libsForQt5.dolphin
    udisks2
    udevil
    gvfs
    dbus
    xdg-utils
    krita
    libsForQt5.okular

    # Music
    pavucontrol
    mpc-cli
    playerctl

    # Office
    xournalpp
    onlyoffice-bin
    wpsoffice
    font-manager

    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "FantasqueSansMono" "Hermit" ]; })

    # Internet
    (firefox.override { extraNativeMessagingHosts = [ passff-host ]; })
    chromium
    deluge
    openvpn

    # Power Management
    xfce.xfce4-power-manager
    networkmanagerapplet

    retroarchFull
    x2goclient
  ];

  # Zsh config
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls - l";
      update = "nix-channel --update && home-manager switch && flatpak update -y && sudo nixos-rebuild switch --upgrade";
      clean = "sudo nix-collect-garbage -d";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "fino-time";
    };
    zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        ];
    }; 
  };

  # Syncthing
  services.syncthing.enable = true;

  # Git working
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Cosheimil";
    userEmail = "a.varvus@ya.ru";
  };

  # VSCodium
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      ms-toolsai.jupyter     
      jdinhlife.gruvbox
      jnoortheen.nix-ide
      mkhl.direnv
      ms-python.python
      njpwerner.autodocstring
      ms-pyright.pyright
      tamasfe.even-better-toml
    ];
  };

  # Direnv
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.java = {
    enable = true;
  };

  # tmux
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
  };

  # Picom
  services.picom = {
   enable = true;
   vSync = true;
   shadow = true;
   backend = "glx";
   activeOpacity = 0.9;
   wintypes = {
     popup_menu = { opacity = config.services.picom.menuOpacity; };
     dropdown_menu = { opacity = config.services.picom.menuOpacity; };
   };
   fade = true;
   fadeDelta = 4;
   settings = {
    blur = {
      method = "dual_kawase";
      strength = 8;
      background = true;
    };
   };
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Kitty setup
    ".config/kitty/kitty.conf".text = ''
      font_size 11.0

      font_family HurmitNFM-Regular
      bold_font auto
      italic_font auto
      bold_italic_font auto
      confirm_os_window_close -1
    '';
    "~/.zshrc".text = "export HSA_OVERRIDE_GFX_VERSION=10.3.0";
    
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
  #  /etc/profiles/per-user/artem/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
