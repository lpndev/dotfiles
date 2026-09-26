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
        inputs.stylix.nixosModules.stylix
        ../hosts/rog16
      ];
    };

    wsl = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.nixosModules.system
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-wsl.nixosModules.default
        inputs.stylix.nixosModules.stylix
        ../hosts/wsl
      ];
    };
  };
}
