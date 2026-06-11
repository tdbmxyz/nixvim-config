{
  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  plugins.neo-tree = {
    enable = true;

    settings = {
      close_if_last_window = true;
      # Prevent these windows from being used as the file open target.
      open_files_do_not_replace_types = [
        "neo-tree"
      ];
      filesystem = {
        follow_current_file = {
          enabled = true;
          leave_dirs_open = true;
        };
        use_libuv_file_watcher = true;
      };

      window = {
        position = "left";
        width = 40;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        silent = true;
        desc = "Toggle Neo-tree";
      };
    }
  ];
}
