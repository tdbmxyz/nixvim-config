{
  config,
  lib,
  ...
}: {
  plugins.bufdelete = {
    enable = true;
  };

  keymaps = lib.mkIf config.plugins.bufdelete.enable [
    {
      mode = "n";
      key = "<C-x>";
      action = "<cmd>Bdelete<CR>";
      options.desc = "Close buffer";
    }
  ];
}
