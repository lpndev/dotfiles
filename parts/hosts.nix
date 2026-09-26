{
  inputs,
  ...
}:

{
  flake.nixosConfigurations = {
    rog16 = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.nixosModules.system
        inputs.home-manager.nixosModules.home-manager
        ../hosts/rog16
      ];
    };

    wsl = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.nixosModules.system
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-wsl.nixosModules.default
        ../hosts/wsl
      ];
    };
  };
}
