{
  lsp.servers = {
    ty.enable = true;

    ruff = {
      enable = true;
      # Let ty provide hover information while Ruff handles diagnostics and code actions.
      config.on_attach.__raw = ''
        function(client)
          client.server_capabilities.hoverProvider = false
        end
      '';
    };
  };

  plugins = {
    conform-nvim.settings.formatters_by_ft.python = [
      "ruff_organize_imports"
      "ruff_format"
    ];

    # Uses a Nix-provided debugpy adapter and resolves project virtual environments.
    dap-python.enable = true;

    neotest = {
      enable = true;
      adapters.python.enable = true;
    };
  };

  autoCmd = [
    {
      desc = "Use Python indentation";
      event = "FileType";
      pattern = "python";
      callback.__raw = ''
        function()
          vim.opt_local.expandtab = true
          vim.opt_local.shiftwidth = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.tabstop = 4
        end
      '';
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>tn";
      action.__raw = "function() require('neotest').run.run() end";
      options.desc = "Run nearest test";
    }
    {
      mode = "n";
      key = "<leader>tf";
      action.__raw = "function() require('neotest').run.run(vim.fn.expand('%')) end";
      options.desc = "Run test file";
    }
    {
      mode = "n";
      key = "<leader>ta";
      action.__raw = "function() require('neotest').run.run(vim.fn.getcwd()) end";
      options.desc = "Run all tests";
    }
    {
      mode = "n";
      key = "<leader>tl";
      action.__raw = "function() require('neotest').run.run_last() end";
      options.desc = "Run last test";
    }
    {
      mode = "n";
      key = "<leader>td";
      action.__raw = "function() require('neotest').run.run({ strategy = 'dap' }) end";
      options.desc = "Debug nearest test";
    }
    {
      mode = "n";
      key = "<leader>ts";
      action.__raw = "function() require('neotest').summary.toggle() end";
      options.desc = "Toggle test summary";
    }
    {
      mode = "n";
      key = "<leader>to";
      action.__raw = "function() require('neotest').output.open({ enter = true }) end";
      options.desc = "Show test output";
    }
  ];
}
