{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.nixos.windowManager.sway;
in {
  options.modules.nixos.windowManager.sway = {
    enable = mkEnableOption "Enable the sway window manager";

    layout = mkOption {
      type = types.str;
      default = "us";
      description = "The keyboard layout to use for sway (maybe?)";
    };
  };

  config = mkIf cfg.enable {
    programs = {
      sway = {
        enable = true;
        extraPackages = with pkgs; [ xwayland gsettings-desktop-schemas ];
      };
      xwayland.enable = true;
    };
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
        };
      };
    };
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
    };
    /*
    qt = {
      enable = true;
      style = "adwaita";
      platformTheme = "gnome";
    };
    */
    security.pam.services.lightdm.u2fAuth = true;
    environment = {
      systemPackages = with pkgs; [
        catppuccin-cursors.frappeDark
        (catppuccin-gtk.override {accents = ["teal"];})
        feh
        gtk2
        gtk3
        gtk4
        papirus-icon-theme
      ];
      variables = {
        NIXOS_OZONE_WL = "1";
        __GL_GSYNC_ALLOWED = "1";
        __GL_VRR_ALLOWED = "1";
        _JAVA_AWT_WM_NONEREPARENTING = "1";
        DISABLE_QT5_COMPAT = "0";
        GDK_BACKEND = "wayland";
        #ANKI_WAYLAND = "1";
        DIRENV_LOG_FORMAT = "";
        #WLR_DRM_NO_ATOMIC = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        #QT_QPA_PLATFORMTHEME = "qt5ct";
        #QT_STYLE_OVERRIDE = "kvantum";
        MOZ_ENABLE_WAYLAND = "1";
        WLR_BACKEND = "vulkan";
        WLR_RENDERER = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";
        XDG_SESSION_TYPE = "wayland";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
        GTK_THEME = "Catppuccin-Frappe-Standard-Teal-Dark";
        #WLR_DRM_DEVICES = "/dev/dri/card0";
      };
    };
  };
}
