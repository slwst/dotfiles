{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cryptsetup
    curl
    git
    hddtemp
    jq
    kitty #for terminfo
    lm_sensors
    nvme-cli
    parted
    unrar
    unzip
    wget
    vim
    zip
  ];
}