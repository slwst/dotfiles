{
  security.pam = {
    loginLimits = [
      {
        domain = "@wheel";
        item = "nofile";
        type = "soft";
        value = "524288";
      }
      {
        domain = "@wheel";
        item = "nofile";
        type = "hard";
        value = "1048576";
      }
    ];
    u2f.enable = true;
    u2f.settings.cue = true;
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };
}
