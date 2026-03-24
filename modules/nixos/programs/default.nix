{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core utilities
    zsh
    ghostty
    kitty
    wget
    curl
    git
    neovim
    htop
    eza
    bat
    fzf
    ripgrep

    # Development
    gcc
    # go
    # nodejs
    # python311
    # python311Packages.pip

    # Tools
    fastfetch

    # Media
    mpv

    # Browsers
    firefox

    # Browsers
    opencode
  ];
  fonts.packages = with pkgs; [
	  nerd-fonts.iosevka
];
}
