{lib, ...}: {
  plugins.hardtime = {
    enable = true;
    settings = {
      disabled_keys = {
        "<Down>" = lib.nixvim.emptyTable;
        "<Left>" = lib.nixvim.emptyTable;
        "<Right>" = lib.nixvim.emptyTable;
        "<Up>" = lib.nixvim.emptyTable;
      };
    };
  };
}
