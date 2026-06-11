{pkgs, ...}: {
  extraPackages = with pkgs; [
    ripgrep
    fzf
    fd
  ];

  clipboard = {
    providers.wl-copy.enable = true;
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";

    loaded_ruby_provider = 0;
    loaded_perl_provider = 0;
    loaded_python_provider = 0;
  };

  opts = {
    lazyredraw = false; # Breaks noice plugin

    # Line numbers
    number = true; # line numbers
    relativenumber = true; # relative numbers for other line than the current
    cursorline = true; # highlight the line where the cursor is

    # 24-bits RGB colors in the TUI
    termguicolors = true;

    # Hide command line unless needed
    cmdheight = 0;

    # Tabs / Indents
    shiftwidth = 2;
    tabstop = 2;
    smartindent = true;
    smarttab = true;

    # Search
    hlsearch = true;
    incsearch = true;
    ignorecase = true;
    smartcase = true;

    # Show lines in the window on top and below the cursor
    scrolloff = 8;

    # Auto re-read a changed file
    autoread = true;

    # Number of suggestions in completion popup
    pumheight = 10;

    # Mouse mode
    mouse = "a";

    # Remove EOB chars
    fillchars.eob = " ";
  };
}
