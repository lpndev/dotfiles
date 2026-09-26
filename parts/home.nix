{
  inputs,
  ...
}:

{
  flake.homeModules.lain = {
    imports = [ (inputs.import-tree ../home/lain) ];
    home.stateVersion = "26.11";
  };
}
