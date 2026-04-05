{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    git lazygit stow
    tmux neovim tealdeer bat jq
    fzf fd ripgrep 
    nix-search-cli
  ];
}
