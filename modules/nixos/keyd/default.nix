{
services.keyd = {
  enable = true;
  keyboards = {
    # The name is just the name of the configuration file, it does not really matter
    default = {
      ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
      settings = {
        main = {
          tab = "overload(l_tab, tab)"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
          capslock = "overload(control, esc)"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
        };
        "capslock:C" = {
	};
      };
      extraConfig = ''
        [l_tab]
        h = left
        j = down
        k = up
        l = right
        enter = backspace
      '';
    };
  };
};
}

