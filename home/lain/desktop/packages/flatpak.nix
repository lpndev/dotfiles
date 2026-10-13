{ inputs, ... }:

{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    overrides.global.Context.filesystems = [ "/nix/store:ro" ];

    packages = [ ];
  };
}
