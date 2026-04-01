{inputs, ...}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
  programs.zen-browser.profiles.default.extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
    ublock-origin
    sponsorblock
    vimium-c
    darkreader
  ];
  programs.zen-browser.profiles.default.settings = {
    browser = {
      browser.compactmode.show = true;
    };
    privacy = {
      privacy.sanitize.clearOnShutdown.hasMigratedToNewPrefs3 = true;
      privacy.clearOnShutdown_v2.cache = false;
      privacy.clearOnShutdown_v2.cookiesAndStorage = false;
      privacy.clearOnShutdown_v2.formdata = true;
    };
  };
}
