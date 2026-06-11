{
  plugins = {
    persisted = {
      enable = true;
      settings = {
        follow_cwd = true;
        use_git_branch = true;
        autoload = true;
      };
    };
  };
  autoCmd = [
    {
      callback = {__raw = "function() vim.cmd('Neotree close') end";};
      desc = "Close Neotree before saving session";
      event = "User";
      pattern = "PersistedSavePre";
    }
    {
      callback = {__raw = "function() vim.cmd('Neotree show') end";};
      desc = "Open Neotree after launch";
      event = "User";
      pattern = "PersistedLoadPost";
    }
  ];
}
