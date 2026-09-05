{
services.keyd = {
  enable = true;
  keyboards = {
    # The name is just the name of the configuration file, it does not really matter
    default = {
      ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
      settings = {
        main = {
          # home row mods: alt ctrl super shift
          # a = "lettermod(shift, a,150, 200)";
          s = "lettermod(alt, s, 150, 200)";
          d = "lettermod(meta, d, 150, 200)";
          f = "lettermod(control, f, 150, 200)";

          j = "lettermod(control, j, 150, 200)";
          k = "lettermod(meta, k,150, 200)";
          l = "lettermod(alt, l,150, 200)";
          # ";" = "lettermod(shift, ;,150, 200)";

          leftshift = "oneshot(shift)";
          rightshift = "oneshot(shift)";
        };
      };
      extraConfig = ''
        [control:C]
        f12 = toggle(gaming)

        [gaming]
        a = a
        s = s
        d = d
        f = f

        j = j
        k = k
        l = l
        ; = ;

        leftshift = leftshift
        rightshift = rightshift
      '';
    };
  };
};
}
