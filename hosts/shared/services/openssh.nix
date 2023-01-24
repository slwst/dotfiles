{ config
, pkgs
, lib
, ...
}: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    forwardX11 = false;
    ports = [ 22 ];
    banner = ''
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⠖⢶⣦⣄⡀⠀⢀⣴⣶⠟⠓⣶⣦⣄⡀⠀⠀⠀⠀⠀⣀⣤⣤⣀⡀⠀⠀⢠⣤⣤⣄⡀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡿⣿⡄⠀⣿⠈⢻⣤⣾⠏⠀⠀⠀⠈⢷⡈⠻⣦⡀⠀⣠⣾⠟⠋⠀⠙⣿⣶⣴⠏⢠⣿⠋⠉⣷⡄⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠁⠈⣿⠀⣿⠃⢸⣿⡏⠀⠀⠀⠀⠀⢸⡻⣦⣹⣇⢠⣿⠃⠀⠀⠀⠀⠘⣇⠙⣧⡿⢁⣴⠞⠛⢿⡆⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠃⠀⠀⢹⣷⣿⣰⡿⢿⡇⠀⠀⠀⠀⠀⢸⢻⣜⣷⣿⣿⡇⠀⠀⠀⠀⠀⠀⣟⣷⣹⣁⡞⠁⠀⠀⠘⣿⡄⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠀⠀⠀⠈⠉⢹⡟⠁⢸⡇⠀⠀⠀⠀⠀⢸⡆⠙⠃⢀⣿⠀⠀⠀⠀⠀⠀⠀⣿⠛⣿⠛⠀⠀⠀⠀⠀⢹⡇⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠈⣇⠀⢸⡇⠀⠀⠀⠀⠀⠀⣇⠀⠀⠘⣿⡄⠀⠀⠀⠀⠀⠀⢹⡀⢸⡇⠀⠀⠀⠀⠀⠘⣿⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⣿⡀⢸⣷⠀⠀⠀⠀⠀⠀⢻⡆⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠸⣧⢸⣿⠀⠀⠀⠀⠀⠀⢿⡆
      ⠀⠀⠀⠀⣠⣤⣶⣶⣿⠿⢶⣶⣤⣄⠀⠀⠘⡇⠀⢻⡄⠀⠀⠀⠀⠀⠀⢳⡀⠀⢻⣧⠀⠀⠀⠀⠀⠀⠀⢿⣾⣿⠀⠀⠀⠀⠀⠀⢸⡇
      ⠀⠀⣴⣿⢟⣯⣭⡎⠀⠀⢀⣤⡟⠻⣷⣄⠀⢹⡄⢸⣇⠀⠀⠀⠀⠀⠀⠈⣷⡀⠘⣿⡄⠀⠀⠀⠀⠀⠀⠀⢿⡏⠀⠀⠀⠀⠀⠀⢸⣧
      ⢀⣾⢏⠞⠉⠀⠀⠀⠀⠀⠻⢿⣿⣀⠼⢿⣶⣶⣷⡀⣿⡀⠀⠀⠀⠀⠀⠀⢸⣇⠀⢻⣷⠀⠀⠀⠀⠀⠀⠀⠈⢿⣆⠀⠀⠀⠀⠀⢸⣿
      ⣸⡷⠋⠀⠀⠀⠀⣠⣶⣿⠦⣤⠄⠀⠀⠀⣿⣿⣦⡀⣿⠇⠀⠀⠀⠀⠀⠀⠀⢻⡀⠈⣿⡆⠀⠀⠀⠀⠀⠀⠀⠈⢻⣆⠀⠀⠀⠀⢸⣿
      ⣿⢁⡴⣾⣿⡆⠀⠙⢛⣡⡾⠋⠀⠀⠀⢠⠇⠈⠛⣿⠏⠀⠀⠀⠀⠀⠀⠰⣄⠸⡗⠛⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣆⠀⠀⠀⣼⣿
      ⢿⡞⠀⠈⢉⡇⠉⠉⠉⠉⠀⠀⠀⠀⣠⠊⠀⢀⡾⠋⠀⠀⠀⠀⠀⢀⡀⠀⣿⠳⠇⠀⢸⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⣿⡇
      ⠸⣷⠀⢠⠎⠀⠀⠀⠀⠀⠀⣀⠴⠋⠀⠖⠚⠋⠀⠀⠀⠀⠀⢀⡄⢸⣷⡀⣿⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢰⣿⠇
      ⠀⢻⣷⣯⣀⣀⣀⣀⣠⠤⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠿⣷⠇⠀⠀⢠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⣾⡟⠀
      ⠀⠈⢻⣷⡉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠃⠀
      ⠀⠀⠀⢻⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠃⠀⠀
      ⠀⠀⠀⠀⠙⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⠇⠀⠀⠀
      ⠀⠀⠀⠀⠀⠈⠻⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡿⠃⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⠟⠁⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣶⣦⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣴⣶⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⡻⠿⠿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⠿⠿⢛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                                                     ~hi
    
    '';
    settings = {
      kbdInteractiveAuthentication = false;
      passwordAuthentication = lib.mkForce false;
      permitRootLogin = lib.mkForce "no";
      useDns = false;
    };

    hostKeys = [
      {
        bits = 4096;
        path = "/etc/ssh/ssh_host_rsa_key";
        type = "rsa";
      }
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  # block repeated failed attempts
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    ignoreIP = [
      "127.0.0/8"
      "10.0.0.0/8"
      "192.168.0.0/16"
    ];
  };

  # enable mosh
  programs.mosh = {
    enable = true;
    withUtempter = true;
  };
}
