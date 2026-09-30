{inputs, ...}: {
  flake.nixosModules.backpain = {pkgs, ...}: {
    networking.hostName = "BACKPAIN";

    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.swiss.packages.x86_64-linux.default
      inputs.project-maxxer.packages.x86_64-linux.default

      nautilus
      keepassxc
      docker-compose
    ];
    boot.loader.grub.extraEntries = ''
      menuentry 'Gentoo Linux (on /dev/nvme0n1p4)' --class gentoo --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
          insmod part_gpt
          insmod ext2
          search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
          linux /boot/vmlinuz-6.18.50-gentoo-dist-bin root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro
          initrd /boot/initramfs-6.18.50-gentoo-dist-bin.img
      }
      submenu 'Advanced options for Gentoo Linux (on /dev/nvme0n1p4)' $menuentry_id_option 'osprober-gnulinux-advanced-00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
          menuentry 'Gentoo GNU/Linux (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist-bin--00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist-bin root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro
              initrd /boot/initramfs-6.18.50-gentoo-dist-bin.img
          }
          menuentry 'Gentoo GNU/Linux, with Linux 6.18.50-gentoo-dist-bin (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist-bin--00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist-bin root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro
              initrd /boot/initramfs-6.18.50-gentoo-dist-bin.img
          }
          menuentry 'Gentoo GNU/Linux, with Linux 6.18.50-gentoo-dist-bin (recovery mode) (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist-bin-root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro single-00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist-bin root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro single
              initrd /boot/initramfs-6.18.50-gentoo-dist-bin.img
          }
          menuentry 'Gentoo GNU/Linux, with Linux 6.18.50-gentoo-dist (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist--00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro
              initrd /boot/initramfs-6.18.50-gentoo-dist.img
          }
          menuentry 'Gentoo GNU/Linux, with Linux 6.18.50-gentoo-dist (recovery mode) (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist-root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro single-00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro single
              initrd /boot/initramfs-6.18.50-gentoo-dist.img
          }
          menuentry 'Gentoo GNU/Linux, with Linux 6.18.50-gentoo-dist.old (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist.old--00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist.old root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro
              initrd /boot/initramfs-6.18.50-gentoo-dist.img.old
          }
          menuentry 'Gentoo GNU/Linux, with Linux 6.18.50-gentoo-dist.old (recovery mode) (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.18.50-gentoo-dist.old-root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro single-00c79a4d-c0f5-4d02-b9e5-08117d3a41cb' {
              insmod part_gpt
              insmod ext2
              search --no-floppy --fs-uuid --set=root 00c79a4d-c0f5-4d02-b9e5-08117d3a41cb
              linux /boot/vmlinuz-6.18.50-gentoo-dist.old root=UUID=00c79a4d-c0f5-4d02-b9e5-08117d3a41cb ro single
              initrd /boot/initramfs-6.18.50-gentoo-dist.img.old
          }
      }
    '';

    virtualisation.docker = {
      enable = true;
      daemon.settings = {
        experimental = true;
        dns = ["1.1.1.1" "8.8.8.8"];
        default-address-pools = [
          {
            base = "172.30.0.0/16";
            size = 24;
          }
        ];
      };
    };
    users.users.snow.extraGroups = ["docker"];
  };
}
