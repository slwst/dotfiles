{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cryptsetup
    curl
    git
    hddtemp
    jq
    kitty #for terminfo
    lm_sensors
    pciutils
    lz4
    nvme-cli
    parted
    unrar
    unzip
    wget
    vim
    zip
  ];
}