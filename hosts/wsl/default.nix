{
  wsl = {
    enable = true;
    defaultUser = "lain";
    useWindowsDriver = true;
  };

  networking.hostName = "wsl";

  environment.sessionVariables = {
    DONT_PROMPT_WSL_INSTALL = "1";
  };

  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "26.11";
}
