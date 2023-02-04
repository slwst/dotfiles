{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;

    settings = {
      theme = "catppuccin_frappe_transparent";
      keys.normal = {
        j = "move_char_left";
        k = "move_line_down";
        l = "move_line_up";
        "'" = "move_char_right";
      };
      keys.select = {
        "%" = "match_brackets";
      };
      editor = {
        color-modes = true;
        cursorline = true;
        mouse = false;
        idle-timeout = 1;
        bufferline = "always";
        true-color = true;
        lsp.display-messages = true;
        rulers = [80];
        indent-guides = {
          render = true;
        };
        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
      };
    };
    themes = {
      catppuccin_frappe_transparent = {
        "inherits" = "catppuccin_frappe";
        "ui.backround" = "{}";
      };
    };
    languages = with pkgs; [
      {
        name = "cpp";
        auto-format = true;
        language-server = {
          command = "${clang-tools}/bin/clangd";
          clangd.fallbackFlags = ["-std=c++2b"];
        };
        formatter = {
          command = "${clang-tools}/bin/clang-format";
          args = ["-i"];
        };
      }
      {
        name = "css";
        auto-format = true;
      }
      {
        name = "go";
        auto-format = true;
        language-server.command = "${gopls}/bin/gopls";
        formatter.command = "${go}/bin/gofmt";
      }
      {
        name = "javascript";
        auto-format = true;
        language-server = {
          command = "${nodePackages.typescript-language-server}/bin/typescript-language-server";
          args = ["--stdio"];
        };
      }
      {
        name = "nix";
        auto-format = true;
        language-server = {command = lib.getExe inputs.nil.packages.${pkgs.system}.default;};
        config.nil.formatting.command = ["nix" "fmt"];
      }
      {
        name = "rust";
        auto-format = true;
        formatter.command = lib.getExe rustfmt;
      }
      {
        name = "typescript";
        auto-format = true;
        language-server = {
          command = "${nodePackages.typescript-language-server}/bin/typescript-language-server";
          args = ["--stdio"];
        };
        formatter.command = "${nodePackages.prettier}/bin/prettier";
      }
    ];
  };
  home.packages = with pkgs; [
    # Dev tools
    black
    clang
    clang-tools
    delve
    elixir_ls
    gawk
    go
    gomodifytags
    gopkgs
    gopls
    gotests
    go-tools
    java-language-server
    kotlin-language-server
    ktlint
    lldb
    rust-analyzer
    rustfmt
    selene
    shellcheck
    sumneko-lua-language-server
    texlab
    uncrustify
    nodePackages.jsonlint
    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.vls
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    nodePackages.yarn
    cargo
  ];
}
