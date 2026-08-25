{
  plugins.floaterm = {
    enable = true;
    settings = {
      wintype = "split";
      opener = "edit ";
      rootmarkers = [
        ".git"
        "*.lock"
      ];
    };
  };

  keymaps = [
    {
      mode = ["n" "t"];
      key = "<C-`>";
      action.__raw = ''
        function()
          if vim.bo.filetype == "floaterm" then
            vim.cmd("wincmd p")
          else
            vim.cmd("FloatermToggle")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Focus terminal or previous window";
      };
    }
    {
      mode = ["n" "t"];
      key = "<C-S-`>";
      action = "<cmd>FloatermToggle!<cr>";
      options = {
        silent = true;
        desc = "Toggle terminal visibility";
      };
    }
  ];
}
