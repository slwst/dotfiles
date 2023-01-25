{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Standard-Teal-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["teal"];
      };
    };

    font = {
      name = "Nunito";
      size = 13;
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba="rgb";
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';

    cursorTheme = {
      package = pkgs.catppuccin-cursors.frappeDark;
      name = "Catppuccin-Frappe-Dark";
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Frappe-Dark";
    package = pkgs.catppuccin-cursors.frappeDark;
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Frappe-Standard-Teal-Dark";
  };

  home.packages = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
    gtk_engines
  ];

}
