{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.nixos.wayland;
in {
  options.modules.nixos.wayland = {
    enable = mkEnableOption "Enable wayland";
  };
  imports = [./services.nix];
  config = mkIf cfg.enable {
    nixpkgs.overlays = with inputs; [nixpkgs-wayland.overlay];
    environment.etc."greetd/environments".text = ''
      Hyprland
    '';

    environment = {
      variables = {
        NIXOS_OZONE_WL = "1";
        __GL_GSYNC_ALLOWED = "0";
        __GL_VRR_ALLOWED = "0";
        _JAVA_AWT_WM_NONEREPARENTING = "1";
        DISABLE_QT5_COMPAT = "0";
        GDK_BACKEND = "wayland";
        ANKI_WAYLAND = "1";
        DIRENV_LOG_FORMAT = "";
        #WLR_DRM_NO_ATOMIC = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        #QT_QPA_PLATFORMTHEME = "qt5ct";
        #QT_STYLE_OVERRIDE = "kvantum";
        MOZ_ENABLE_WAYLAND = "1";
        WLR_BACKEND = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";
        XDG_SESSION_TYPE = "wayland";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
        GTK_THEME = "Catppuccin-Frappe-Standard-Teal-Dark";
        #WLR_DRM_DEVICES = "/dev/dri/card0";
      };
      loginShellInit = ''
        dbus-update-activation-environment --systemd DISPLAY
      '';
    };

    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [
          vaapiVdpau
          libvdpau-va-gl
        ];
      };
      pulseaudio.support32Bit = true;
    };

    programs.xwayland.enable = true;

    qt = {
      enable = true;
      style = "adwaita";
      platformTheme = "gnome";
    };

    xdg.portal = {
      enable = true;
      wlr.enable = false;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        inputs.xdg-portal-hyprland.packages.${pkgs.system}.default
      ];
    };

    sound = {
      enable = true;
      mediaKeys.enable = true;
    };
  };
}
