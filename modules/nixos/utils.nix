{ pkgs, ... }:

{
    services = {
        upower.enable = true;
        udisks2.enable = true;
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
    bash zsh wget curl git neovim htop eza bat fzf ripgrep
    acpi
  ];
}
