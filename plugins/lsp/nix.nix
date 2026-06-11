{
  lib,
  pkgs,
  ...
}: {
  lsp.servers = {
    statix.enable = true;
    nixd = {
      enable = true;
      config.settings.nixd.formatting.command = ["${lib.getExe pkgs.alejandra}"];
    };
  };

  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
      };
    };

    lint = {
      lintersByFt = {
        nix = ["deadnix"];
      };
    };
  };
}
