{
  imports = [
    ./dap.nix
    ./lsp-signature.nix
    ./luasnip.nix
    ./nix.nix
  ];

  plugins = {
    lint.enable = true;
    lspconfig.enable = true;
    lspkind.enable = true;
  };

  lsp = {
    inlayHints.enable = true;
  };
}
