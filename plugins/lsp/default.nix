{
  imports = [
    ./lsp-signature.nix
    ./luasnip.nix
    ./nix.nix
  ];

  plugins = {
    lspconfig.enable = true;
    lspkind.enable = true;
  };

  lsp = {
    inlayHints.enable = true;
  };
}
