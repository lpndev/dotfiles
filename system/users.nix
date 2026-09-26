{
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;

  users.users.lain = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };
}
