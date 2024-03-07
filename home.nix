{ config, pkgs, ... }:

{
  home.username = "collin";
  home.homeDirectory = "/home/collin";

  home.packages = with pkgs; [
    firefox
    kate
    reaper
    spotify
    sublime
    transmission    
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;    

    shellAliases = {
      ll = "ls -l";
    };
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "pip"
        "tmux"
        "rust"
      ];
      theme = "af-magic";
    };
  };

  # Add more home-manager configuration options as needed
  home.stateVersion = "23.11";
}
