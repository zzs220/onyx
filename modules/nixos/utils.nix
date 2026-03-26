{ pkgs, ... }:

{
    services = {
        upower.enable = true;
        udisks2.enable = true;
        gvfs.enable = true;
    };
    documentation = {
        enable = true;
        doc.enable = false;
        man.enable = true;
        dev.enable = false;
        info.enable = false;
        nixos.enable = false;
    };
  environment.systemPackages = with pkgs; [
    home-manager
    bash zsh tmux wget curl git neovim btop eza bat fzf ripgrep
    acpi zip unzip
    btrfs-progs
  ];
}
