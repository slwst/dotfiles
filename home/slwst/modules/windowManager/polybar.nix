{ config
, pkgs
, inputs
, ...
}: {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      pulseSupport = true;
      i3Support = true;
    };
    script = ''
      MONITOR=DP-0 polybar --reload main &
      MONITOR=HDMI-1 polybar --reload extra &
    '';
    extraConfig = builtins.readFile (pkgs.fetchFromGitHub
      {
        owner = "catppuccin";
        repo = "polybar";
        rev = "9ee66f83335404186ce979bac32fcf3cd047396a";
        sha256 = "bUbSgMg/sa2faeEUZo80GNmhOX3wn2jLzfA9neF8ERA=";
      } + "/themes/frappe.ini");
    settings = {
      "settings" = {
        screenchange-reload = true;
        pseudo-transparancy = false;
      };
      "bar/base" = {
        height = "30pt";
        radius = "20";
        background = "#aa303446";
        foreground = "\${colors.text}";
        offset-y = "0.5%";
        line-size = "5pt";
        border-size = "6px";
        border-color = "\${colors.transparent}";
        padding-left = 2;
        padding-right = 2;
        module-margin = 1;
        separator = "|";
        separator-foreground = "\${colors.overlay1}";
        font-0 = "mononoki Nerd Font Mono:style=Regular:size=16";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = true;
      };
      "bar/main" = {
        "inherit" = "bar/base";
        monitor = "\${env:MONITOR:}";
        width = "100%";
        modules-left = "i3 xwindow";
        modules-center = "spotify";
        modules-right = "pulseaudio memory cpu date";
      };
      "bar/extra" = {
        "inherit" = "bar/base";
        monitor = "\${env:MONITOR:}";
        width = "100%";
        modules-left = "i3";
      };
      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;
        show-urgent = true;
        strip-wsnumbers = true;
        index-sort = true;
        enable-click = false;
        enable-scroll = false;

        label-focused-foreground = "\${colors.mauve}";
        label-focused-background = "\${colors.surface0}";
        label-focused-underline = "\${colors.teal}";

        label-unfocused-foreground = "\${colors.lavender}";
        label-unfocused-underline = "\${colors.text}";
        
        label-visible-foreground = "\${colors.lavender}";
        label-visible-underline = "\${colors.text}";
      };
      "module/spotify" = {
        type = "custom/script";
        tail = true;
        interval = 1;
        prefix-format = "<prefix-symbol>";
        format = "<label>";
        format-foreground = "\${colors.sapphire}";
        exec = (pkgs.writeShellScriptBin "scroll_spotify_status" ''

          # The name of polybar bar which houses the main spotify module and the control modules.
          PARENT_BAR="main"
          PARENT_BAR_PID=$(${pkgs.procps}/bin/pgrep -a "polybar" | ${pkgs.gnugrep}/bin/grep "$PARENT_BAR" | ${pkgs.coreutils}/bin/cut -d" " -f1)

          # Set the source audio player here.
          # Players supporting the MPRIS spec are supported.
          # Examples: spotify, vlc, chrome, mpv and others.
          # Use `playerctld` to always detect the latest player.
          # See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
          PLAYER="playerctld"

          # Format of the information displayed
          # Eg. {{ artist }} - {{ album }} - {{ title }}
          # See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
          FORMAT="{{ title }} - {{ artist }}"

          # Sends $2 as message to all polybar PIDs that are part of $1
          update_hooks() {
              while IFS= read -r id
              do
                  ${pkgs.polybar}/bin/polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
              done < <(echo "$1")
          }

          PLAYERCTL_STATUS=$(${pkgs.playerctl}/bin/playerctl --player=$PLAYER status 2>/dev/null)
          EXIT_CODE=$?

          if [ $EXIT_CODE -eq 0 ]; then
              STATUS=$PLAYERCTL_STATUS
          else
              STATUS="No player is running"
          fi

          if [ "$1" == "--status" ]; then
              echo "$STATUS"
          else
              if [ "$STATUS" = "Stopped" ]; then
                  echo "No music is playing"
              elif [ "$STATUS" = "Paused"  ]; then
                  update_hooks "$PARENT_BAR_PID" 2
                  ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
              elif [ "$STATUS" = "No player is running"  ]; then
                  echo "$STATUS"
              else
                  update_hooks "$PARENT_BAR_PID" 1
                  ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
              fi
          fi
        '') + "/bin/scroll_spotify_status";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        label-active = "%name%";
        label-active-background = "\${colors.surface0}";
        label-active-underline = "\${colors.lavender}";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-padding = 1;

        label-urgent = "%name%";
        label-urgent-background = "\${colors.red}";
        label-urgent-padding = 1;

        label-empty = "%name%";
        label-empty-foreground = "\${colors.transparent}";
        label-empty-padding = 1;
      };
      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title%";
        format-foreground = "\${colors.peach}";
      };
      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        format-volume-prefix = "VOL ";
        format-volume-prefix-foreground = "\${colors.maroon}";
        format-volume = "<label-volume>";
        label-volume = "%percentage%%";
        label-muted = "mute";
        label-muted-foreground = "\${colors.peach}";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = "Ram ";
        format-prefix-foreground = "\${colors.pink}";
        label = "%percentage_used:2%%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix = "CPU ";
        format-prefix-foreground = "\${colors.flamingo}";
        label = "%percentage:2%%";
      };
      "module/date" = {
        type = "internal/date";
        interval = 1;

        date = "%Y-%m-%d %H:%M:%S";
        date-alt = "%I:%M %p";

        label = "%date%";
        label-foreground = "\${colors.rosewater}";
      };
    };
  };

  # startup w/ i3
  xsession.windowManager.i3.config.startup = [
    { command = "systemctl --user restart polybar"; always = true; notification = false; }
  ];
}
