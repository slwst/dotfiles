{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    package = pkgs.vscodium-fhs;

    extensions = [
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc
    ];
  };
}
