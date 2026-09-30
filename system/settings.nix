{
  nixpkgs.config.allowUnfree = true;

  nix = {
    optimise.automatic = true;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  programs.nix-ld.enable = true;
}
