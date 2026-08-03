{
  autoCmd = [
    # 'autoread' only works when something triggers a check
    {
      desc = "Reload file when changed outside of Neovim";
      event = ["FocusGained" "BufEnter" "CursorHold"];
      command = "if getcmdwintype() == '' | checktime | endif";
    }
  ];
}
