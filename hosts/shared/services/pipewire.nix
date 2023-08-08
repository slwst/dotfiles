{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = false;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  systemd.user.services = {
    pipewire.wantedBy = ["default.target"];
    pipewire-pulse.wantedBy = ["default.target"];
  };


  environment.etc = let
    json = pkgs.formats.json {};
  in {
    "wireplumber/main.lua.d/99-alsa-onboard.lua".text = ''
      alsa_monitor.rules = {
        {
          matches = {{{ "node.name", "equals", "alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio__sink"}}};
          apply_properties = {
            ["audio.format"] = "S32LE",
            ["audio.rate"] = "192000",
            ["device.nick"] = "Onboard Audio"
          },
        },
      }
    '';
    
    "wireplumber/main.lua.d/98-alsa-headroom.lua".text = ''
      rule = {
        matches = {
          {
            { "device.name", "matches", "alsa_card.*" },
          },
        },
        apply_properties = {
          ["api.alsa.soft-mixer"] = "true",
          ["api.alsa.disable-batch"] = "true",
          ["session.suspend-timeout-seconds"] = 0,
        }
      }
      table.insert(alsa_monitor.rules,rule)
    '';
    /*
    "pipewire/pipewire.d/10-rates.conf".source = json.generate "10-rates.conf" {
      context.properties = {
        default.clock.min-quantum = 1024;
      };
    };

    "pipewire/pipewire-pulse.d/93-latency.conf".source = json.generate "93-latency.conf" {
      pulse.properties = {
        pulse.min.quantum = "1024/48000";
      };
    };
    */
  };
}
