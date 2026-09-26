{
  inputs,
  ...
}:

{
  flake.nixosModules.system = {
    imports = [ ../profiles/minimal.nix ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users = inputs.self.homeModules;
    };
  };
}
