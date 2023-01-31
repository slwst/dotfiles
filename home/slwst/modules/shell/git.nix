{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "slwst";
    userEmail = "email@slw.st";
    signing = {
      key = "AD52C5FB3EFECC7A";
      signByDefault = true;
    };
    extraConfig = {
      init = {defaultBranch = "main";};
    };
  };
}
