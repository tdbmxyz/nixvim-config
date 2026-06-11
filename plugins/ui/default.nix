{
  imports = [
    ./bufferline.nix
    ./lualine.nix
    ./smear-cursor.nix
  ];

  plugins = {
    helpview.enable = true;
    trim.enable = true;
    web-devicons.enable = true;
  };
}
