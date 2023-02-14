{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      alejandra
      nix-prefetch-github
    ];
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
