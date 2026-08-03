{
  plugins.floaterm = {
    enable = true;
    settings = {
      wintype = "split";
      keymap_toggle = "<C-`>";
      opener = "edit ";
      rootmarkers = [
        ".git"
        "*.lock"
      ];
    };
  };
}
