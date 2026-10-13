{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    vesktop
    spotify
  ];
}
