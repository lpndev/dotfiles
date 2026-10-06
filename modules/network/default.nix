{
  users.users.lain.extraGroups = [ "networkmanager" ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = "1.1.1.2#security.cloudflare-dns.com";
      FallbackDNS = "";
      Domains = "~.";
      DNSSEC = "yes";
      DNSOverTLS = "yes";
    };
  };
}
