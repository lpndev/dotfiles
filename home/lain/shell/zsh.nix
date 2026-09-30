{
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/AppImages"
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    shellAliases = {
      sudo = "sudo ";
      ll = "la -hl";
      lt = "la -T --git-ignore";
    };

    initContent = ''
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
      [[ $SHLVL -le 2 ]] && fastfetch
    '';
  };
}
