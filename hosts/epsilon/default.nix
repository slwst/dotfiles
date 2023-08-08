{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # shared config
    ../shared
  ];

  boot = {
    # latest kernel
#      kernelPackages = pkgs.linuxPackages_latest;
      kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = ["quiet"];

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["btrfs"];
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
    i2c.enable = true;
    openrazer.enable = true;

    pulseaudio.enable = false;
  };

  services = {
    btrfs.autoScrub.enable = true;
    acpid.enable = true;
    #thermald.enable = true;
    upower.enable = true;
    hardware.openrgb = {
      enable = true;
      motherboard = "intel";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      acpi
      brightnessctl
      gcc
      libva-utils
      ocl-icd
      vulkan-tools
    ];
  };

  modules.nixos = {
    bootloader.grub = {
      enable = true;
      efiSysMountPoint = "/boot";
      device = "nodev";
    };

    hardware.nvidia.enable = true;
    steam.enable = true;

    virtualization = {
      docker = {
        enable = true;
        enableNvidia = true;
      };

      libvirtd.enable = true;

      podman = {
        enable = true;
        enableNvidia = true;
      };
    };

    windowManager.i3 = {
      enable = true;
      layout = "us";
    };
  };

  system.stateVersion = lib.mkForce "22.11";
}
