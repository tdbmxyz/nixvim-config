{
  config,
  lib,
  ...
}: {
  plugins = {
    persisted = {
      enable = true;
      settings = {
        follow_cwd = true;
        use_git_branch = true;
        autoload = true;
        on_autoload_no_session =
          if config.plugins.dashboard.enable
          then lib.nixvim.mkRaw "function() vim.cmd(\"Dashboard\") end"
          else lib.nixvim.mkRaw "function() end";
      };
    };
  };
}
