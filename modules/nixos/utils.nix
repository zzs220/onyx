{ pkgs, ... }:

{
  programs = {
    nix-ld.enable = true;
    neovim.enable = true;
  };

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#onyx";
      hms = "home-manager switch --flake /etc/nixos#zrd@onyx ";
      ncc = "cp /etc/nixos/flake.lock ~/nixos/flake.lock && sudo rm -rf /etc/nixos/* && sudo cp -r ~/nixos/* /etc/nixos/ && sudo rm -rf /etc/nixos/.git";
      nfu = "sudo nix flake update --flake /etc/nixos";
      nsc = "nix-search";
    };
  };

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
  };

  environment.systemPackages = with pkgs; [
      bash bash-completion zsh zsh-completions
      gcc
      git tmux btop jq
      wget curl rsync file busybox
      acpi zip unzip p7zip unrar
      btrfs-progs
      sqlite tree-sitter
  ];
}
