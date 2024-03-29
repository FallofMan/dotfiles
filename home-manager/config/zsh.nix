{config, pkgs, ...}:
{
  # Configure zsh
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
}