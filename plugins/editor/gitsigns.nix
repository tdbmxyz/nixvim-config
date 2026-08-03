{
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns nav_hunk next<CR>";
      options.desc = "Next hunk";
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns nav_hunk prev<CR>";
      options.desc = "Previous hunk";
    }
    {
      mode = ["n" "v"];
      key = "<leader>hs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options.desc = "Stage hunk";
    }
    {
      mode = ["n" "v"];
      key = "<leader>hr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options.desc = "Reset hunk";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options.desc = "Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options.desc = "Blame line";
    }
  ];
}
