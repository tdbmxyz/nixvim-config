{
  dependencies.yazi.packageFallback = true;
  plugins.yazi = {
    enable = true;
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
