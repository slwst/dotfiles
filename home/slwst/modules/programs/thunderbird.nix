{
  programs.thunderbird = {
    enable = true;
    profiles = {
      slwst = {
        isDefault = true;
        withExternalGnupg = true;
      };
    };
    settings = {
      "privacy.donottrackheader.enabled" = true;
    };
  };
}
