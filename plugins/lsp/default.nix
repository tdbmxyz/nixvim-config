{
  imports = [
    ./dap.nix
    ./lsp-signature.nix
    ./luasnip.nix
    ./nix.nix
    ./python.nix
  ];

  plugins = {
    lint.enable = true;
    lspconfig.enable = true;
    lspkind.enable = true;
  };

  lsp = {
    inlayHints.enable = true;

    servers = {
      rust_analyzer.enable = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "gd";
      action.__raw = "vim.lsp.buf.definition";
      options.desc = "Go to definition";
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = "vim.lsp.buf.declaration";
      options.desc = "Go to declaration";
    }
    {
      mode = "n";
      key = "<leader>lr";
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "Rename symbol";
    }
    {
      mode = ["n" "v"];
      key = "<leader>la";
      action.__raw = "vim.lsp.buf.code_action";
      options.desc = "Code action";
    }
  ];
}
