{ ... }: {
    flake.nixosModules.cpuIntel = { config, lib, ... }: {
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
