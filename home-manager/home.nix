# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    #Git
    ./config/git.nix

    #zsh
    ./config/zsh.nix

    #Waybar
    ./config/waybar.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "collin";
    homeDirectory = "/home/collin";
  };

  home.packages = with pkgs; [
    #Text editor
    vscodium
    gh #Github integration

    #Browser
    firefox
    chromium
    qutebrowser

    #image viewer
    imv

    #Color palette
    eyedropper

    #App launcher
    bemenu

    #File browser
    xfce.thunar

    #Font
    jetbrains-mono
    nerdfonts  
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Add more home-manager configuration options as needed
  home.stateVersion = "23.11";
}
