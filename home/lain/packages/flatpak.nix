{
  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    packages = [ ];
    overrides.global.Context.filesystems = [ "/nix/store:ro" ];
  };
}
