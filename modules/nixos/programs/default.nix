{ pkgs, ... }:
{
  imports = [
    ./dev.nix
    ./terminal.nix
    ./games.nix
    ./opencode.nix
    ./media.nix
  ];
}
