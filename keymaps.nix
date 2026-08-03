{
  keymaps = [
    # Move around windows with arrow keys
    {
      key = "<C-Left>";
      mode = ["n"];
      action = "<C-w>h";
      options.desc = "Focus window left";
    }
    {
      key = "<C-Right>";
      mode = ["n"];
      action = "<C-w>l";
      options.desc = "Focus window right";
    }
    {
      key = "<C-Up>";
      mode = ["n"];
      action = "<C-w>k";
      options.desc = "Focus window up";
    }
    {
      key = "<C-Down>";
      mode = ["n"];
      action = "<C-w>j";
      options.desc = "Focus window down";
    }
    # Shift windows with arrow keys
    {
      key = "<C-S-Left>";
      mode = ["n"];
      action = "<C-w>H";
      options.desc = "Move window left";
    }
    {
      key = "<C-S-Right>";
      mode = ["n"];
      action = "<C-w>L";
      options.desc = "Move window right";
    }
    {
      key = "<C-S-Up>";
      mode = ["n"];
      action = "<C-w>K";
      options.desc = "Move window up";
    }
    {
      key = "<C-S-Down>";
      mode = ["n"];
      action = "<C-w>J";
      options.desc = "Move window down";
    }
    {
      key = "<leader>/";
      mode = ["n"];
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Clear search highlight";
    }
    {
      key = "<leader>|";
      mode = ["n"];
      action = "<cmd>vsp<CR>";
      options.desc = "Vertical split";
    }
    {
      key = "<leader>_";
      mode = ["n"];
      action = "<cmd>sp<CR>";
      options.desc = "Horizontal split";
    }
  ];
}
