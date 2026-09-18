/*
{self,inputs,...}: {
  flake.nixosModules.network = {pkgs,lib,...}: {
    networking = {
      networkmanager = {
        enable = true;
        settings = {
          main.hostname-mode = "none";
        };
      };
      firewall = {
        enable = false;
      };
    };
    services.openssh = {
            enable= true;
    };
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
*/
{...}: {
  flake.nixosModules.network = {...}: {
    networking = {
      networkmanager = {
        enable = true;
        dns = "none";
        settings = {
          main = {
            "hostname-mode" = "none";
          };
        };
      };
      nameservers = [
        "127.0.0.1"
        "::1"
      ];
      firewall = {
        enable = true;
        allowedTCPPorts = [8384 8080 8000 80 22];
      };
    };
    services.unbound = {
      enable = true;
      settings = {
        forward-zone = [
          {
            name = ".";
            forward-addr = [
              "1.1.1.1@853#cloudflare-dns.com"
              "1.0.0.1@853#cloudflare-dns.com"
              "8.8.8.8@853#dns.google"
              "8.8.4.4@853#dns.google"
            ];
            forward-tls-upstream = true;
          }
        ];
      };
    };
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
