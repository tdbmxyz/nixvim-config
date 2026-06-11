{config, ...}: {
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      manix.enable = true;
    };
    settings = {
      defaults.mappings.i."<esc>" = "close";
      pickers = {
        buffers.sort_mru = true;
      };
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find project file";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command history";
      };
      "<leader>r" = {
        action = "live_grep";
        options.desc = "Grep (respect .gitignore)";
      };
      "<leader>b" = {
        action = "buffers";
        options.desc = "Buffers";
      };
      "<leader>fr" = {
        action = "resume";
        options.desc = "Resume";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Commits";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Status";
      };
      "<leader>sp" = {
        action = "lsp_references";
        options.desc = "List LSP references";
      };
      "<leader>sd" = {
        action = "lsp_diagnostics";
        options.desc = "List LSP diagnostics";
      };
      "<leader>n" = {
        action = "manix";
        options.desc = "Open Manix";
      };
    };
  };
  dependencies = {
    manix = {
      enable = true;
      packageFallback = true;
    };
    ripgrep = {
      enable = true;
      packageFallback = true;
    };
  };
}
