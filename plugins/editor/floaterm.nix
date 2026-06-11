{
  plugins.floaterm = {
    enable = true;
    settings = {
      wintype = "split";
      # keymap_kill = "<leader>fk";
      # keymap_new = "<leader>ft";
      # keymap_next = "<leader>fn";
      # keymap_prev = "<leader>fp";
      keymap_toggle = "<C-`>";
      opener = "edit ";
      rootmarkers = [
        ".git"
        "*.lock"
      ];
    };
  };
}
