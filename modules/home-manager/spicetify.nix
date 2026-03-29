# Spicetify is a spotify client customizer
{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;
    theme = lib.mkForce spicePkgs.themes.sleek;
    colorScheme = "Greener";
    enabledExtensions = with spicePkgs.extensions; [
      # adblockify
      # playlistIcons
      # lastfm
      # historyShortcut
      # hidePodcasts
      # fullAppDisplay
      # keyboardShortcut
    ];
  };
}
