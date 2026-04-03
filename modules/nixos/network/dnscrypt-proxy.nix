{
  networking = {
    useDHCP = false;
    nameservers = [ "127.0.0.1" ];
    networkmanager.dns = "none";
    resolvconf.enable = true;
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      server_names = [
        "cloudflare"
      ];
      listen_addresses = [ "127.0.0.1:53" ];
      require_dnssec = true;
    };
  };
}
