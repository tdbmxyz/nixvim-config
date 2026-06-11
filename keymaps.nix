{
  keymaps = [
    # Move around windows with arrow keys
    {
      key = "<C-Left>";
      mode = ["n"];
      action = "<C-w>h";
    }
    {
      key = "<C-Right>";
      mode = ["n"];
      action = "<C-w>l";
    }
    {
      key = "<C-Up>";
      mode = ["n"];
      action = "<C-w>k";
    }
    {
      key = "<C-Down>";
      mode = ["n"];
      action = "<C-w>j";
    }
    # Shift windows with arrow keys
    {
      key = "<C-S-Left>";
      mode = ["n"];
      action = "<C-w>H";
    }
    {
      key = "<C-S-Right>";
      mode = ["n"];
      action = "<C-w>L";
    }
    {
      key = "<C-S-Up>";
      mode = ["n"];
      action = "<C-w>K";
    }
    {
      key = "<C-S-Down>";
      mode = ["n"];
      action = "<C-w>J";
    }
    {
      key = "<leader>/";
      mode = ["n"];
      action = "<cmd>nohlsearch<CR>";
    }
  ];
}
