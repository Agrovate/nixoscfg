{
  flake.diskoConfigurations.backpainFileSystem = {
    disko.devices = {
      disk.main = {
        device = "/dev/disk/by-id/nvme-PC_SN530_NVMe_WDC_256GB_22074K801654";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            ESP = {
              name = "ESP";
              size = "1G";
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
              name = "root";
              size = "100%";

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            swap = {
              size = "8G";

              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
          };
        };
      };
    };
  };
}
