{
  wsl = {
    enable = true;
    defaultUser = "lain";
    useWindowsDriver = true;
  };

  environment.sessionVariables = {
    DONT_PROMPT_WSL_INSTALL = "1";
  };
}
