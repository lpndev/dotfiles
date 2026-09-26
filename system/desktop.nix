{
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };

      xkb.layout = "us";
    };

    displayManager.defaultSession = "xfce";
  };
}
