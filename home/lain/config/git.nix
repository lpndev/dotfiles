{ config, ... }:

{
  programs.git = {
    enable = true;

    lfs.enable = true;

    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      init.defaultBranch = "main";

      user = {
        name = "lpndev";
        email = "137980570+lpndev@users.noreply.github.com";
      };
    };
  };
}
