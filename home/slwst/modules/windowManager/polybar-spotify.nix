{pkgs, ...}: {
  type = "custom/script";
  tail = true;
  interval = 1;
  prefix-format = "<prefix-symbol>";
  format = "<label>";
  format-foreground = "\${colors.sapphire}";
  exec =
    (pkgs.writeShellScriptBin "scroll_spotify_status" ''

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
              ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
          elif [ "$STATUS" = "No player is running"  ]; then
              echo ""
          else
              ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
          fi
      fi
    '')
    + "/bin/scroll_spotify_status";
}
