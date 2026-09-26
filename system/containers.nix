{
  pkgs,
  ...
}:

{
  virtualisation = {
    containers = {
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

  environment.systemPackages = with pkgs; [ podman-tui ];
}
