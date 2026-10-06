{
  pkgs,
  ...
}:

{
  services = {
    libinput = {
      enable = true;

      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };

    xserver = {
      enable = true;

      excludePackages = with pkgs; [
        xterm
      ];
    };
  };
}
