{...}: {
  flake.nixosModules.preservation = {...}: {
    boot.tmp.cleanOnBoot = true;
    preservation = {
      enable = true;

      preserveAt."/persist" = {
        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
          "/etc/ssh/ssh_host_ed25519_key"
          "/etc/ssh/ssh_host_ed25519_key.pub"
          "/etc/ssh/ssh_host_rsa_key"
          "/etc/ssh/ssh_host_rsa_key.pub"
        ];
        directories = [
          "/var/lib/systemd/"
          "/var/lib/nixos/"
          "/var/log/"
          "/var/lib/bluetooth/"
          "/etc/NetworkManager/system-connections"
          "/var/lib/NetworkManager"
          "/tmp"
        ];

        users.snow = {
          files = [];
          directories = [
            "nixoscfg"
            ".ssh"
            ".config"
            ".local"
          ];
        };
      };
    };
  };
}
