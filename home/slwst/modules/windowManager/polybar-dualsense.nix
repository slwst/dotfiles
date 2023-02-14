{pkgs, ...}: {
  type = "custom/script";
  tail = true;
  interval = 1;
  prefix-format = "<prefix-symbol>";
  format = "<label>";
  format-foreground = "\${colors.sapphire}";
  exec =
    (pkgs.writeShellScriptBin "dualsense_batt" ''
      FOUND=0
      SYMBOL="󰐔"
      LEVELS="$SYMBOL"
      for dir in /sys/class/power_supply/ps-controller-battery-*/; do
        if [ -d $dir ]; then
          FOUND=$((FOUND+1))
          LEVEL=$(${pkgs.coreutils}/bin/cat $dir/capacity)
          LEVELS="$LEVELS $LEVEL"
        fi
      done
      if (( $FOUND >> 0)); then
        echo $LEVELS
      else
        echo ""
      fi
    '')
    + "/bin/dualsense_batt";
}
