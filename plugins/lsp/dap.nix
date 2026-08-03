{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    dap.enable = true;

    # C / C++ / Rust debugging via codelldb, with cargo target selection
    dap-lldb = {
      enable = true;
      settings.codelldb_path = lib.getExe' pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter "codelldb";
    };

    dap-ui.enable = true;
    dap-virtual-text.enable = true;
  };

  # Open / close dap-ui with the debug session
  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui"] = function() dapui.close() end
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      options.desc = "Toggle breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = "function() require('dap').continue() end";
      options.desc = "Continue / start debugging";
    }
    {
      mode = "n";
      key = "<leader>do";
      action.__raw = "function() require('dap').step_over() end";
      options.desc = "Step over";
    }
    {
      mode = "n";
      key = "<leader>di";
      action.__raw = "function() require('dap').step_into() end";
      options.desc = "Step into";
    }
    {
      mode = "n";
      key = "<leader>dO";
      action.__raw = "function() require('dap').step_out() end";
      options.desc = "Step out";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = "function() require('dap').terminate() end";
      options.desc = "Terminate session";
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = "function() require('dapui').toggle() end";
      options.desc = "Toggle DAP UI";
    }
  ];
}
