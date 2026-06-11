{
  imports = [
    ./blink.nix
    ./bufdelete.nix
    ./conform.nix
    ./cutlass.nix
    ./flash.nix
    ./floaterm.nix
    ./fugitive.nix
    ./gitsigns.nix
    ./hardtime.nix
    ./lz-n.nix
    ./neo-tree.nix
    ./persisted.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./which-key.nix
    ./yazi.nix
  ];

  plugins = {
    gitmessenger.enable = true;
  };
}
