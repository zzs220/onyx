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

    # Media
    mpv

    # Browsers
    firefox

    # 
    opencode
  ];
  fonts.packages = with pkgs; [
	  nerd-fonts.iosevka
];
}
