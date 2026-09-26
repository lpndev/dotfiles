{
  lib,
  ...
}:

{
  hardware = {
    enableAllFirmware = lib.mkDefault true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
