{
  config,
  lib,
  ...
}: {
  plugins = {
    noice = {
      enable = true;

      lazyLoad.settings.event = "DeferredUIEnter";

      settings = {
        lsp = {
          progress.enabled = true;
          signature.enabled = !config.plugins.lsp-signature.enable;
        };

        presets = {
          bottom_search = false;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = true;
          lsp_doc_border = true;
        };

        routes = [
          {
            filter = {
              event = "msg_show";
              any = [
                {find = "%d+L, %d+B";}
                {find = "; after #%d+";}
                {find = "; before #%d+";}
              ];
            };
            view = "mini";
          }
          # Skip "Pattern not found" messages
          {
            filter = {
              event = "msg_show";
              find = "Pattern not found";
            };
            opts = {
              skip = true;
            };
          }
          # Route long messages (>20 lines) to split
          {
            filter = {
              event = "msg_show";
              min_height = 20;
            };
            view = "split";
            opts = {
              enter = true;
            };
          }
        ];
      };
    };
  };

  keymaps = lib.mkIf (config.plugins.telescope.enable && config.plugins.noice.enable) [
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>Telescope noice<CR>";
      options = {
        desc = "Find notifications";
      };
    }
    {
      mode = "c";
      key = "<S-Enter>";
      action.__raw = ''
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end
      '';
      options = {
        desc = "Redirect Cmdline to Popup";
      };
    }
  ];
}
