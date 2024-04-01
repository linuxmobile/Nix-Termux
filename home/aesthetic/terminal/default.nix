{config, ...}: let
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./editors/helix
    ./programs
    ./shell/starship.nix
    ./shell/zsh.nix

    ./services/gpg-agent.nix
  ];

  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = "${cache}/less/history";
    LESSKEY = "${conf}/less/lesskey";

    EDITOR = "hx";
    DIRENV_LOG_FORMAT = "";

    # auto-run programs using nix-index-database
    NIX_AUTO_RUN = "1";
  };
}
