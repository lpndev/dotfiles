{
  programs.fastfetch = {
    enable = true;

    settings = {
      display.separator = " ";

      logo.type = "small";

      modules = [
        {
          type = "host";
          key = "host  ";
          format = "{2}";
        }
        {
          type = "os";
          key = "os    ";
          format = "{2}";
        }
        {
          type = "kernel";
          key = "kernel";
          format = "{2}";
        }
        {
          type = "packages";
          key = "pkgs  ";
          format = "{all}";
        }
        {
          type = "shell";
          key = "shell ";
          format = "{1}";
        }
        {
          type = "terminal";
          key = "term  ";
          format = "{1}";
        }
        {
          type = "wm";
          key = "wm    ";
          format = "{1}";
        }
        {
          type = "command";
          key = "age   ";
          text = "echo $(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days";
        }
        {
          type = "uptime";
          key = "uptime";
          format = "{1}d {2}h {3}m";
        }
      ];
    };
  };
}
