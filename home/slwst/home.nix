{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "slwst";
    homeDirectory = "/home/slwst";
    stateVersion = "22.11";
    extraOutputsToInstall = ["doc" "devdoc"];
  };

  programs.home-manager.enable = true;
}
