{
  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  plugins.neo-tree = {
    enable = true;

    settings = {
      closeIfLastWindow = true;
      # Prevent these windows from being used as the file open target.
      open_files_do_not_replace_types = [
        "neo-tree"
      ];
      filesystem = {
        followCurrentFile.enabled = true;
        useLibuvFileWatcher = true;
      };

      window = {
        position = "left";
        width = 40;

        mappings = {
          "<space>" = "none";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        silent = true;
        desc = "Toggle Neo-tree";
      };
    }
  ];

  # `nvim .` hit-enter guard for Neovim ≥ 0.12.2
  #
  # Problem: without netrw, Neovim reads the directory argument as a regular file,
  # producing error messages that accumulate into a "Press any key to continue" prompt.
  # In Neovim ≥ 0.12.2 the `msg_show.return_prompt` UI event was removed, so noice
  # can no longer auto-dismiss that prompt.
  #
  # Fix (two-phase):
  #   Phase 1 — init.lua time: scan argv() for directories and set buftype=nofile on
  #   each pre-created buffer so that rendering the initial window does not trigger a
  #   file read.  :argdelete is intentionally deferred to Phase 2 so that alpha-nvim's
  #   VimEnter autocmd (registered earlier, fires first) still sees argc() > 0 and
  #   skips its dashboard — preventing the brief flash of the startup screen.
  #
  #   Phase 2 — VimEnter: remove each directory from the arglist with :argdelete, then
  #   if argc() is now 0 (all args were directories), cd into the first directory and
  #   open neo-tree.  Because our VimEnter is registered after alpha's, it fires second,
  #   so alpha has already decided not to show the dashboard before argdelete runs.
  extraConfigLua = ''
    do
      local dir_args = {}
      for i = 0, vim.fn.argc() - 1 do
        local raw = vim.fn.argv(i)
        local full = vim.fn.fnamemodify(raw, ":p"):gsub("/+$", "")
        if vim.fn.isdirectory(full) == 1 then
          table.insert(dir_args, { raw = raw, full = full })
        end
      end
      if #dir_args > 0 then
        -- Phase 1: block the file-read that would produce error messages.
        for _, d in ipairs(dir_args) do
          local bufnr = vim.fn.bufnr(d.raw)
          if bufnr ~= -1 then
            vim.bo[bufnr].buftype = "nofile"
          end
        end
        -- Phase 2: defer argdelete until VimEnter so alpha-nvim's earlier VimEnter
        -- still sees argc() > 0 and skips the dashboard (avoids a brief flash).
        vim.api.nvim_create_autocmd("VimEnter", {
          once = true,
          callback = function()
            for _, d in ipairs(dir_args) do
              pcall(vim.cmd, "argdelete " .. vim.fn.fnameescape(d.raw))
            end
            if vim.fn.argc() == 0 then
              vim.api.nvim_set_current_dir(dir_args[1].full)
              vim.cmd("Neotree toggle")
            end
          end,
        })
      end
    end
  '';
}
