{
  config,
  pkgs,
  ...
}: {
  boot.plymouth = {
    enable = true;
    theme = "rings";
    themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["rings"];})];
  };
}
