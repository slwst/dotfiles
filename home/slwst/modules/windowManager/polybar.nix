{ config
, pkgs
, inputs
, ...
}: {
  services.polybar = {
    enable = true;
    config = ./polybar-config;
    script = "polybar top &";
  };
}
