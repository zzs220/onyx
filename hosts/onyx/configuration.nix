{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./user.nix

    ../../modules/nixos/display/default.nix
    ../../modules/nixos/login/default.nix

    ../../modules/nixos/network/default.nix
    ../../modules/nixos/boot/default.nix
    ../../modules/nixos/audio/default.nix
    ../../modules/nixos/hardware/default.nix
    ../../modules/nixos/keyd/default.nix
    ../../modules/nixos/utils.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/programs/default.nix
    ../../modules/nixos/tlp.nix
    ../../modules/nixos/fixes.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.zrd = import ./home.nix;
  };

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };
  system.stateVersion = "25.11";

}
