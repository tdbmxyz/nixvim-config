{lib, ...}: {
  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        sources = {
          providers = {
            ripgrep = {
              async = true;
              module = "blink-ripgrep";
              name = "Ripgrep";
              score_offset = 100;
              opts = {
                prefix_min_len = 3;
                context_size = 5;
                max_filesize = "1M";
                project_root_marker = ".git";
                project_root_fallback = true;
                search_casing = "--ignore-case";
                additional_rg_options = {};
                fallback_to_regex_highlighting = true;
                ignore_paths = {};
                additional_paths = {};
                debug = false;
              };
            };
          };

          default = [
            "lsp"
            "path"
            "buffer"
            "ripgrep"
          ];
        };

        cmdline = {
          completion = {
            preset = "super-tab";
            list.selection.preselect = false;
          };
        };

        completion = {
          ghost_text.enabled = true;

          trigger = {
            prefetch_on_insert = true;
            show_on_backscpace = true;
            show_in_snippet = false;
          };

          documentation = {
            auto_show = true;
            window.border = "rounded";
          };

          menu = {
            draw = {
              treesitter = ["lsp"];
              components = {
                kind_icon.text = lib.nixvim.mkRaw ''
                  function(ctx)
                    return require('lspkind').symbol_map[ctx.kind] or ""
                  end
                '';
              };
            };
          };
        };

        fuzzy = {
          implementation = "rust";
          sorts = [
            "exact"
            "score"
            "sort_text"
          ];
          prebuild_binaries.download = false;
        };

        keymap.preset = "super-tab";
      };
    };

    blink-indent = {
      enable = true;
      settings = {
        scope.underline.enabled = true;
      };
    };

    blink-pairs = {
      enable = true;
    };

    blink-ripgrep = {
      enable = true;
    };
  };
}
