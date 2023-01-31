{
  pkgs,
  lib,
  ...
}: {
  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override {fonts = ["Mononoki"];})
      inter
      (google-fonts.override {fonts = ["Nunito"];}).out
      noto-fonts
      noto-fonts-emoji
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = false;
      subpixel.lcdfilter = "default";

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["mononoki Nerd Font Mono"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
      };
    };
  };
}
