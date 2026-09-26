{
  pkgs,
  ...
}:

{
  imports = [
    ../../profiles/workspace.nix
    ../../system/nvidia.nix
  ];

  networking.hostName = "rog16";

  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  zramSwap.enable = true;

  services = {
    thermald.enable = true;
    tlp.enable = true;
    fstrim.enable = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ ];
    extraModulePackages = [ ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ ];
      kernelModules = [ ];
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";

      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-label/swap";
    }
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "26.11";
}
