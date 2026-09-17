{...}: {
  flake.diskoConfigurations.backpainFileSystem = {pkgs, ...}: {
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/nvme0n1";

          content = {
            type = "gpt";

            partitions = {
              ESP = {
                size = "5.9G";
                type = "EF00";

                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";

                  mountOptions = [
                    "fmask=0022"
                    "dmask=0022"
                  ];
                };
              };

              root = {
                size = "228.7G";

                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };

              swap = {
                size = "3.9G";

                content = {
                  type = "swap";
                };
              };
            };
          };
        };
      };
    };
  };
}
