{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.nixos.hardware.nvidia;
in {
  options.modules.nixos.hardware.nvidia = {
    enable = mkEnableOption "Enable NVIDIA";
  };

  config = mkIf cfg.enable {
    # Load modules on boot
    boot.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "i2c-nvidia_gpu"];

    services.xserver = {
      videoDrivers = ["nvidia"];
    };

    environment.variables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      VDPAU_DRIVER = "va_gl";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
      };

      opengl.extraPackages = with pkgs; [nvidia-vaapi-driver];
    };
  };
}
