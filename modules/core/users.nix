{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.lain = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
