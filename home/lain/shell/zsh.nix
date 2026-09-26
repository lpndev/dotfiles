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

    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      path = "${config.xdg.cacheHome}/zsh/history";
      size = 10000;
      save = 10000;
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
