{pkgs, ...}:

{
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
  ];
  programs.appimage.enable = true;
  programs.appimage.binfmt = true; # execution attempt of .appimage file will be forced to use appimage-run some appimage may not work
  programs.appimage.package = pkgs.appimage-run.override
  {
    extraPkgs = pkgs:
      [
        pkgs.icu
        pkgs.libxcrypt-legacy
        # pkgs.python312
        # pkgs.python312Packages.torch
      ];
  };
  environment.systemPackages = with pkgs; [
    # steam-run
  ];
}
