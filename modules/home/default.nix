{
  home = {
    username = "slwst";
    homeDirectory = "/home/slwst";
    stateVersion = "22.11";
    #	extraOutputsToInstall = ["doc" "devdoc"];
  };

  imports = [
    ./packages.nix

    ./git
    ./rofi
    ./polybar
    ./tools
  ];

  programs.home-manager.enable = true;
}
