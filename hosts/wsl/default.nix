{
  imports = [
    ../../system/appearance.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "lain";
    useWindowsDriver = true;
    wslConf.network.generateResolvConf = true;
  };

  networking.hostName = "wsl";

  environment.sessionVariables = {
    DONT_PROMPT_WSL_INSTALL = "1";
  };

  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "26.11";
}
