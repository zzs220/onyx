{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Terminal
    ghostty
    kitty

    # Tools
    fastfetch
    nix-search-cli

    # Media
    mpv

    # Browsers
    # firefox

    # AI
    opencode
  ];
}
