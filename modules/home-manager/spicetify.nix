# Spicetify is a spotify client customizer
{
  pkgs,
  config,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;
    # theme = lib.mkForce spicePkgs.themes.dribbblish;
    # colorScheme = "custom";
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
