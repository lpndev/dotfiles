{
  pkgs,
  ...
}:

{
  virtualisation = {
    containers = {
      enable = true;

      registries.settings = {
        unqualified-search-registries = [ "docker.io" ];
      };
    };

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd.enable = true;
  };

  programs.virt-manager.enable = true;

  users.users.lain.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [ podman-tui ];
}
