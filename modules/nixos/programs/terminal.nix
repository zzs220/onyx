{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
    ghostty
  ];
}
