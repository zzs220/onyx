{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    noctalia-shell noctalia-qs
    nwg-look adw-gtk3 papirus-icon-theme kdePackages.qt6ct
  ];
}
