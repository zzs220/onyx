{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    adwaita-fonts
    fira-code
    jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
  ];

}
