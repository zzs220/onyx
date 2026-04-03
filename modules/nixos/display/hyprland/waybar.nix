{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    waybar wofi
    hyprlock hypridle
  ];
}
