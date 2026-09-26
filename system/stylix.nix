{
  pkgs,
  ...
}:

let
  jetbrainsMono = {
    package = pkgs.nerd-fonts.jetbrains-mono;
    name = "JetBrainsMono Nerd Font";
  };
in

{
  stylix = {
    enable = true;

    polarity = "light";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/default-light.yaml";

    fonts = {
      serif = jetbrainsMono;
      sansSerif = jetbrainsMono;
      monospace = jetbrainsMono;
      emoji = jetbrainsMono;
    };

    icons = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
    };

    cursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };
  };
}
