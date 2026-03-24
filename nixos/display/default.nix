{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XCURSOR_SIZE = "24";
      XCURSOR_THEME = "Adwaita";
    };
  };

  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
  	thunar waybar wofi wl-clipboard brightnessctl
	noctalia-shell noctalia-qs
  ];
}
