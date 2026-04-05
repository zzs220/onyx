{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/home/tr.nix
    ../modules/home/utils.nix
    ../modules/home/programs/default.nix
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "zrd";
    homeDirectory = "/home/zrd";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";

  home.activation.cloneDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
  set -x
  echo "=== CLONE DOTFILES STEP ==="
  echo "HOME is: $HOME"

  # Add git to PATH
  export PATH=${pkgs.git}/bin:$PATH

  if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles..."
    git clone https://github.com/zzs220/dotfiles.git "$HOME/dotfiles"
  fi
'';
  home.activation.stowDotfiles = lib.hm.dag.entryAfter ["cloneDotfiles"] ''
  export PATH=${pkgs.stow}/bin:$PATH

  if [ -d "$HOME/dotfiles" ]; then
    echo "Running stow..."
    $HOME/dotfiles/stow.sh
  fi
'';
}
