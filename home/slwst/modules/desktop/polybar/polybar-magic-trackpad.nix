{pkgs, ...}: {
  type = "custom/script";
  tail = true;
  interval = 1;
  prefix-format = "<prefix-symbol>";
  format = "<label>";
  format-foreground = "#F6F6F6";
  exec =
    (pkgs.writeShellScriptBin "trackpad_batt" ''

      BTTARGET="hid-d4:57:63:5f:80:d1-battery"
      HIDTARGET="hid-CC22072008M0FLWAD-battery"

      FOUND=0
      #SYMBOL="󰟸"
      #SYMBOL="󰀵"
      SYMBOL="󰹞"

      DIR="/sys/class/power_supply/$BTTARGET"
      if [ ! -d $DIR ]; then
        DIR="/sys/class/power_supply/$HIDTARGET"
        SYMBOL="󰙟"
        if [ ! -d $DIR ]; then
          echo ""
          exit
        fi
      fi
      LEVEL=$(${pkgs.coreutils}/bin/cat $DIR/capacity)
      OUTPUT="$SYMBOL $LEVEL"
      echo $OUTPUT
    '')
    + "/bin/trackpad_batt";
}
