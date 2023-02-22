{pkgs, ...}: {
  type = "custom/script";
  tail = true;
  interval = 1;
  prefix-format = "<prefix-symbol>";
  format = "<label>";
  format-foreground = "#F6F6F6";
  exec =
    (pkgs.writeShellScriptBin "trackpad_batt" ''

      TARGET="hid-d4:57:63:5f:80:d1-battery"

      FOUND=0
      #SYMBOL="󰟸"
      #SYMBOL="󰀵"
      SYMBOL="󰹞"
      LEVELS="$SYMBOL"

      DIR="/sys/class/power_supply/$TARGET"
      if [ -d $DIR ]; then
        LEVEL=$(${pkgs.coreutils}/bin/cat $DIR/capacity)
        LEVELS="$LEVELS $LEVEL"
        echo $LEVELS
      else
        echo ""
      fi
    '')
    + "/bin/trackpad_batt";
}
