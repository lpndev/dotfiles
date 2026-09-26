{ pkgs, ... }:

{
  programs.dconf.enable = true;
  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  home-manager.sharedModules = [
    {
      fonts.fontconfig.enable = true;

      gtk = {
        enable = true;
        colorScheme = "light";

        font = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
          size = 10;
        };

        theme = {
          package = pkgs.gnome-themes-extra;
          name = "Adwaita";
        };

        iconTheme = {
          package = pkgs.adwaita-icon-theme;
          name = "Adwaita";
        };
      };

      home.pointerCursor = {
        enable = true;
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "adwaita";

        qt5ctSettings = {
          Appearance = {
            icon_theme = "Adwaita";
            style = "adwaita";
          };
          Fonts = {
            fixed = ''"JetBrainsMono Nerd Font,10"'';
            general = ''"JetBrainsMono Nerd Font,10"'';
          };
        };

        qt6ctSettings = {
          Appearance = {
            icon_theme = "Adwaita";
            style = "adwaita";
          };
          Fonts = {
            fixed = ''"JetBrainsMono Nerd Font,10"'';
            general = ''"JetBrainsMono Nerd Font,10"'';
          };
        };
      };
    }
  ];
}
