{ pkgs, ... }:
{
  home.packages = with pkgs; [
    stow
    git lazygit
    tealdeer
  ];
}
