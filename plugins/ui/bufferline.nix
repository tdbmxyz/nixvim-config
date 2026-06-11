{
  plugins = {
    bufferline = {
      enable = true;
      settings.options.offsets = [
        {
          filetype = "neo-tree";
          highlight = "Directory";
          text = "File Explorer";
          text_align = "center";
        }
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<M-]>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<M-[>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
    # {
    #   mode = "n";
    #   key = "<leader>bl";
    #   action = "<cmd>BufferLineCloseLeft<cr>";
    #   options = {
    #     desc = "Delete buffers to the left";
    #   };
    # }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
  ];
}
