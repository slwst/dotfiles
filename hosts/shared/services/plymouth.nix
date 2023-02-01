{
  config,
  pkgs,
  ...
}:{
  boot.plymouth = {
    enable = true;
    theme = "colorful_sliced";
    themePackages = [ pkgs.adi1090x-plymouth-themes.colorful_sliced ];
  };
}