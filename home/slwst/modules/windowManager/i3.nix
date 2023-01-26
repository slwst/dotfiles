{pkgs, lib, ...}: {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      bars = [];
      fonts = {
        names = [ "mononoki Nerd Font" ];
        size = 14.0;
      };
      
      gaps = {
        inner = 5;
        outer = 5;
      };

      window.border = 0;

      floating = {
        criteria = [
          {
            title = "Steam - Update News";
          }
          {
            class = "Pavucontrol";
          }
        ];
        modifier = "${modifier}";
      };


      keybindings = lib.mkOptionDefault {
        # Movement
        # alphas
        "${modifier}+j" = "exec i3-msg border pixel 1; focus left";
        "${modifier}+k" = "exec i3-msg border pixel 1; focus down";
        "${modifier}+l" = "exec i3-msg border pixel 1; focus up";
        "${modifier}+apostrophe" = "exec i3-msg border pixel 1; focus right";
        "--release ${modifier}+j" = "exec i3-msg border pixel 0";
        "--release ${modifier}+k" = "exec i3-msg border pixel 0";
        "--release ${modifier}+l" = "exec i3-msg border pixel 0";
        "--release ${modifier}+apostrophe" = "exec i3-msg border pixel 0";

        # cursor keys
        "${modifier}+Left" = "exec i3-msg border pixel 1; focus left";
        "${modifier}+Down" = "exec i3-msg border pixel 1; focus down";
        "${modifier}+Up" = "exec i3-msg border pixel 1; focus up";
        "${modifier}+Right" = "exec i3-msg border pixel 1; focus right";
        "--release ${modifier}+Left" = "exec i3-msg border pixel 0";
        "--release ${modifier}+Down" = "exec i3-msg border pixel 0";
        "--release ${modifier}+Up" = "exec i3-msg border pixel 0";
        "--release ${modifier}+Right" = "exec i3-msg border pixel 0";

        # Container Split
        "${modifier}+h" = "split h";
        "${modifier}+v" = "split v";
        "${modifier}+f" = "fullscreen toggle";

        # Container Layout
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        
        # Media Keys
        # Volume
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute"= "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        # Player Controls
        "XF86AudioPlay" = "exec playerctl -a play-pause";
        "XF86AudioPause" = "exec playerctl -a play-pause";
        "XF86AudioNext" = "exec playerctl -a next";
        "XF86AudioPrevious" = "exec playerctl -a previous";
        # Brightness
        "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";

        # Programs
        "${modifier}+Return" = "exec kitty";
        "${modifier}+d" = "exec rofi -modi drun -show drun";
        "${modifier}+Shift+d" = "exec rofi -show window";
        "${modifier}+b" = "exec brave";
        "${modifier}+Shift+x" = "exec systemctl suspend"; 

        # Misc
        # resize mode
        "${modifier}+r" = "mode resize";
        # blink window with focus
        "${modifier}+z" = "exec i3-msg border pixel 1";
        "--release ${modifier}+z" = "exec i3-msg border pixel 0";
      };

      modes = {
        resize = {
          j = "resize shrink width 10 px or 10 ppt";
          k = "resize grow height 10 px or 10 ppt";
          l = "resize shrink height 10 px or 10 ppt";
          apostrophe = "resize grow width 10 px or 10 ppt";
          Left = "resize shrink width 10 px or 10 ppt";
          Up = "resize grow height 10 px or 10 ppt";
          Down = "resize shrink height 10 px or 10 ppt";
          Right = "resize grow width 10 px or 10 ppt";
          Return = "mode default";
          Escape = "mode default";
        };
      };
    };
  };
}
