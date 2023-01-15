{pkgs, ...}: {
  environment = {
    binsh = "${pkgs.bash}/bin/bash";
    shells = with pkgs; [fish];

    loginShellInit = ''
      dbus-update-activation-environment --all
    '';
  };
}
