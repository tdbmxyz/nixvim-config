{
  dependencies.yazi.packageFallback = true;
  plugins.yazi = {
    enable = true;
    # Add the Nixvim version to the end of PATH, to use local version
    settings = {
      open_for_directories = true;
    };

    lazyLoad.settings.cmd = ["Yazi"];
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Yazi<cr>";
      options = {
        desc = "Yazi toggle";
        silent = true;
      };
    }
  ];
}
