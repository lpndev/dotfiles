{ inputs, ... }:

{
  flake.nixosConfigurations = {
    rog16 = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        {
          networking.hostName = "rog16";
          nixpkgs.hostPlatform = "x86_64-linux";
          system.stateVersion = "26.11";
        }
        inputs.self.nixosModules.home
        (inputs.import-tree ../modules)
        ../hosts/rog16
      ];
    };

    wsl = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        {
          networking.hostName = "wsl";
          nixpkgs.hostPlatform = "x86_64-linux";
          system.stateVersion = "26.11";
        }
        inputs.self.nixosModules.system
        inputs.nixos-wsl.nixosModules.default
        ../hosts/wsl
      ];
    };
  };
}
