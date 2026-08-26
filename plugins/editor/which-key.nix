{
  plugins.which-key = {
    enable = true;

    settings = {
      win.border = "single";
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Debug";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>h";
          group = "Git hunks";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "LSP";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Search";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Tests";
        }
      ];
    };
  };
}
