{
  inputs,
  ...
}:

{
  flake.nixosModules.system = {
    imports = [
      inputs.self.nixosModules.home
      ../profiles/minimal.nix
    ];
  };
}
