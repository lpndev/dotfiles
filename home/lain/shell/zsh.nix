{
  config,
  ...
}:

{
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/AppImages"
  ];

  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;

    history = {
      path = "${config.xdg.cacheHome}/zsh/history";
    };

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    completionInit = ''
      autoload -Uz compinit
      mkdir -p "$HOME/.cache/zsh"
      compinit -d "$HOME/.cache/zsh/zcompdump"
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
    '';

    shellAliases = {
      sudo = "sudo ";
      la = "ls -a";
      ll = "la -hl";
      lt = "la -T --git-ignore";
    };

    initContent = ''
      [[ $SHLVL -le 2 ]] && fastfetch
    '';
  };
}
