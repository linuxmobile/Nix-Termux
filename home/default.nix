{
  config,
  pkgs,
  ...
}: {
  imports = [./aesthetic/terminal];

  home = {
    stateVersion = "23.11";

    language = import ./aesthetic/language.nix;

    file = import ./aesthetic/file.nix config;

    packages = import ./aesthetic/packages.nix pkgs;
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}
