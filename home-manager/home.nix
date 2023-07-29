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

  # Fonts working
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # GTK Themes
    vimix-gtk-themes
    stilo-themes
    zuki-themes
    dracula-theme

    # Terminal and more
    kitty
    zsh
    neofetch
    btop 
    arandr
    conky
    feh
      
    # Dev
    helix
    vscodium
    gh
    
    # Window Managers
    qtile
    awesome
    dunst
    rofi
    picom
    nitrogen

    # Graphics
    flameshot

    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "FantasqueSansMono" ]; })

    # Internet
    firefox

  ];

  # Git working
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Cosheimil";
    userEmail = "a.varvus@ya.ru";
    # signing = {
    #   key = "me@yrashk.com";
    #   signByDefault = false;
    # };
  };

  # Services working
  services.dunst = {
    enable = true;
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Kitty setup
    ".config/kitty/kitty.conf".text = ''
      font_size 11.0

      # font_family HurmitNFM-Regular
      bold_font auto
      italic_font auto
      bold_italic_font auto
    '';
    
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
    EDITOR = "helixx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
