{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.nixos.virtualization.podman;
in {
  options.modules.nixos.virtualization.podman = {
    enable = mkEnableOption "Enable The Podman Container Engine";

    enableNvidia = mkOption {
      type = types.bool;
      default = false;
      description = "Enable NVIDIA Support";
    };
  };

  config = mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      enableNvidia = cfg.enableNvidia;
      extraPackages = with pkgs; [
        skopeo
        conmon
        runc
      ];
    };
  };
}
