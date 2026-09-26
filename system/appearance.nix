{
  pkgs,
  ...
}:

{
  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs.dconf.enable = true;
}
