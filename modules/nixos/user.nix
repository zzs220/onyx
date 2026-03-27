{lib, pkgs, ...}: {
  users.users = {
    root = {
      shell = pkgs.zsh;
    };
    zrd = {
      initialPassword = "rockyou.txt";
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
      ];
      extraGroups = ["wheel" "networkmanager" "audio" "video" "bluetooth" "storage"];
    };
  };
}
