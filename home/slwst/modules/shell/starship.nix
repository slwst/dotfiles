{
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      scan_timeout = 10;
      add_newline = true;
      line_break.disabled = false;
      cmd_duration.disabled = false;

      format = let 
        activeModules = "$golang$kubernetes$nodejs$rust$nix_shell";
      in ''
        [](#5534a5)$username$hostname[](bg:#A85CF9 fg:#5534a5)$directory[](fg:#A85CF9 bg:#072227)$git_branch$git_status[](fg:#072227 bg:#35858B)[${activeModules}](bg:#35858B)[](fg:#35858B bg:#4FBDBA)$time[ ](fg:#4FBDBA)
      '';

      username = {
        show_always = true;
        style_user = "bg:#5534a5";
        style_root = "bg:#5534a5";
        format = "[$user ]($style)";
      };
      hostname = {
        ssh_only = true;
        format = "[@ $hostname $ssh_symbol]($style)";
        style = "bg:#5534a5";
      };
      directory = {
        style = "bg:#A85CF9";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        symbol = "";
        style = "bg:#072227";
        format = "[[ $symbol $branch ](bg:#072227)]($style)";
      };
      git_status = {
        style = "bg:#072227";
        format = "[[($all_status$ahead_behind )](bg:#072227)]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        format = "[[ ♥ $time ](bg:#4FBDBA fg:#000000)]($style)";
      };
      golang = {
        symbol = " ";
        style = "bg:#35858B";
        format = "[[ $symbol ($version) ](bg:#35858B)]($style)";
      };
      nodejs = {
        symbol = " ";
        style = "bg:#35858B";
        format = "[[ $symbol ($version) ](bg:#35858B)]($style)";
      };
      rust = {
        symbol = " ";
        style = "bg:#35858B";
        format = "[[ $symbol ($version) ](bg:#35858B)]($style)";
      };
      kubernetes = {
        symbol = "☸ ";
        style = "bg:#35858B";
        format = "[[ $symbol ($version) ](bg:#35858B)]($style)";
      };
      nix_shell = {
        symbol = " ";
        style = "bg:#35858B";
        format = "[[ $symbol$state( \($name\))](bg:#35858B)]($style)";
        impure_msg = "impure";
        pure_msg = "pure";
      };
    };
  };
}
