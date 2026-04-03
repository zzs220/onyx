{ pkgs, ... }:
{
  imports = [
    ./dev.nix
    ./games.nix
  ];
  environment.systemPackages = with pkgs; [
    # Terminal
    ghostty
    kitty

    # Tools
    fastfetch
    nix-search-cli

    # Media
    mpv
    ffmpeg

    # Browsers
    # firefox

    # AI
    opencode
  ];
}
