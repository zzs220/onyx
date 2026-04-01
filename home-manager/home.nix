# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # inputs.self.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../modules/home-manager/tr.nix
    ../modules/home-manager/utils.nix
    ../modules/home-manager/apps/default.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "zrd";
    homeDirectory = "/home/zrd";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
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
