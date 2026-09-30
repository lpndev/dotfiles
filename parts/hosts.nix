{
  inputs,
  ...
}:

{
  flake.nixosConfigurations = {
    rog16 = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.nixosModules.system
        ../hosts/rog16
      ];
    };

    wsl = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.nixosModules.system
        inputs.nixos-wsl.nixosModules.default
        ../hosts/wsl
      ];
    };
  };
}
