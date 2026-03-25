{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Terminal
    ghostty
    kitty

    # Development
    gcc
    # go
    # nodejs
    # python311
    # python311Packages.pip

    # Tools
    fastfetch
    nix-search-cli

    # Media
    mpv

    # Browsers
    firefox

    # AI
    opencode
  ];
}
