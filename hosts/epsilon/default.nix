{ config
, lib
, pkgs
, ...
}: {
  imports = [
    ./hardware-configuration.nix

    # shared config
    ../shared
  ];

  boot = {
    # latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "btrfs" ];
    };
  };

  hardware = {
    opengl = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };

  services = {
    btrfs.autoScrub.enable = true;
    acpid.enable = true;
    thermald.enable = true;
    upower.enable = true;
  };

  modules.nixos = {
    bootloader.grub = {
      enable = true;
      efiSysMountPoint = "/boot";
      device = "nodev";
    };

    hardware.nvidia.enable = true;

    virtualisation = {
      docker = {
        enable = true;
       # enableNvidia = true;
      };

      libvirtd.enable = true;

      podman = {
        enable = true;
       # enableNvidia = true;
      };
    };
  };

  system.stateVersion = lib.mkForce "22.11";
}
