{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    btop
    codex
    fd
    ffmpeg
    imagemagick
    inetutils
    jq
    lazygit
    micro
    nixd
    nixfmt
    ripgrep
    wget
  ];
}
