{ ... }: {
    flake.nixosModules.gpuAmd = { pkgs, ... }: {
        services.xserver.videoDrivers = [ "amdgpu" ];

        hardware.graphics = {
            enable = true;
        };

        environment.sessionVariables = {
            LIBVA_DRIVER_NAME = "radeonsi";
        };
    };
}
