{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        homeModules.lain = {
          imports = [
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
            (inputs.import-tree ./home/lain)
          ];

          home.stateVersion = "26.11";
        };

        nixosModules = {
          home = {
            imports = [ inputs.home-manager.nixosModules.home-manager ];

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users = inputs.self.homeModules;
            };
          };

          system.imports = [
            inputs.self.nixosModules.home
            (inputs.import-tree ./modules/core)
          ];
        };

        nixosConfigurations = {
          rog16 = inputs.nixpkgs.lib.nixosSystem {
            modules = [
              {
                networking.hostName = "rog16";
                nixpkgs.hostPlatform = "x86_64-linux";
                system.stateVersion = "26.11";
              }
              # inputs.self.nixosModules.system
              (inputs.import-tree ./modules)
              ./hosts/rog16
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
              ./hosts/wsl
            ];
          };
        };
      };
    };
}
