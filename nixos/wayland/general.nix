{ config, pkgs, ...}:
{
  environment.extraInit = ''
      #Turn off gui for ssh auth
      unset -v SSH_ASKPASS
    '';
  users.users.collin.extraGroups = [ "video" ];
  programs.light.enable = true;
}
