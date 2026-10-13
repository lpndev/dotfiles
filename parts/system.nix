{ inputs, ... }:

{
  flake.nixosModules.system.imports = [
    inputs.self.nixosModules.home
    (inputs.import-tree ../modules/core)
  ];
}
