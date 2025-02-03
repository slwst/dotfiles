{
  lib,
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
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
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
    languages = {
      language = [
        {
          name = "cpp";
          auto-format = false;
          formatter = {
            command = "${pkgs.clang-tools}/bin/clang-format";
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
          comment-token = "//";
          #formatter.command = "${pkgs.gotools}/bin/goimports";
          language-servers = [ "gopls" "golangci-lint-langserver" ];
        }
        {
          name = "javascript";
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = false;
        }
        {
          name = "typescript";
          auto-format = true;
          formatter.command = "${pkgs.nodePackages.prettier}/bin/prettier";
        }
      ];
      language-server = {
        clangd = {
          command = "${pkgs.clang-tools}/bin/clangd";
          clangd.fallbackFlags = ["-std=c++2b"];
        };
        gopls = {
          command = "${pkgs.gopls}/bin/gopls";
          config = {
            gofumpt = true;
            local = "goimports";
            semanticTokens = true;
            staticcheck = true;
            usePlaceholders = true;
            completeUnimported = true;
            verboseOutput = true;
            analyses = {
              fieldalignment = true;
              nilness = true;
              unusuedparams = true;
              unusuedwrite = true;
              useany = true;
            };
            hints = {
              assignVariableType = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
          };
        };
        golangci-lint-langserver = {
          command = "${pkgs.golangci-lint-langserver}/bin/golangci-lint-langserver";
        };
        nil = {
          command = lib.getExe pkgs.nil;
          config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
        };
        typescript-language-server = with pkgs.nodePackages; {
          command = "${typescript-language-server}/bin/typescript-language-server";
          args = ["--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib"];
        };
      };
    };
  };
  home.packages = with pkgs; [
    # Dev tools
    black
    clang
    clang-tools
    delve
    gawk
    go
    golangci-lint-langserver
    gomodifytags
    gopkgs
    gopls
    gotests
    gotools
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
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    nodePackages.yarn
    cargo
  ];
}
