{pkgs, lib, config, ...}: {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      defaultWorkspace = "workspace number 1";
      assigns = {
        "0: term" = [{ class = "^kitty$"; }];
        "1: web" = [{ window_role = "^browser$"; }];
        "2: comms" = [{ class = "^discord$"; } { class = "^session$"; }];
        "8: music" = [{ class = "^Spotify$"; }];
      };

      workspaceOutputAssign = [
        {
          workspace = "0: term";
          output = "DP-0";
        }
        {
          workspace = "1: web";
          output = "HDMI-1";
        }
        {
          workspace = "2: comms";
          output = "HDMI-1";
        }
        {
          workspace = "7: gaming";
          output = "DP-0";
        }
        {
          workspace = "8: music";
          output = "HDMI-1";
        }
        {
          workspace = "9: mail";
          output = "HDMI-1";
        }
      ];
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
          {
            title = "NVIDIA Settings";
          }
        ];
        modifier = "${modifier}";
      };

      startup = [
        { command = "kitty"; }
        { command = "brave"; }
        { command = "spotifywm"; }
      ];

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

        # Workspaces
        "${modifier}+0" = "workspace 0: term";
        "${modifier}+1" = "workspace 1: web";
        "${modifier}+2" = "workspace 2: comms";
        "${modifier}+7" = "workspace 7: gaming";
        "${modifier}+8" = "workspace 8: music";
        "${modifier}+9" = "workspace 9: mail";
        

        # Screenshots
        "Print" = "exec --no-startup-id maim ${config.xdg.userDirs.pictures}/screenshot-$(date +%Y%m%d-%H%M%S).png";
        "${modifier}+Print" = "exec --no-startup-id maim --window $(xdotool getactivewindow) ${config.xdg.userDirs.pictures}/screenshot-$(date +%Y%m%d-%H%M%S).png";
        "Shift+Print" = "exec --no-startup-id maim --select ${config.xdg.userDirs.pictures}/screenshot-$(date +%Y%m%d-%H%M%S).png";
        # Screenshots (Clipboard)
        "Ctrl+Print" = "exec --no-startup-id maim | xclip -selection clipboard -t image/png";
        "Ctrl+${modifier}+Print" = "exec --no-startup-id maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png";
        "Ctrl+Shift+Print" = "exec --no-startup-id maim --select | xclip -selection clipboard -t image/png";
        
        # Blink window with focus
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
  home = {
    packages = with pkgs; [
      maim
      xclip
      xdotool
    ];
  };
}
