{ config
, pkgs
, ...
}: {
  programs.git = {
    enable = true;
    userName = "slwst";
    userEmail = "email@slw.st";
    signing = {
      key = "AD52C5FB3EFECC7A";
      signByDefault = false;
    };
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };
}
