{
  config,
  pkgs,
  ...
}: {
  # Packages
  environment = {
    # packages = import ./packages.nix pkgs;
    # Backup etc files instead of failing to activate generation if a file already exists in /etc
    etcBackupExtension = ".bak";
  };

  # Read the changelog before changing this value
  system.stateVersion = "23.11";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Set shell
  user.shell =
    if builtins.elem pkgs.zsh config.environment.packages
    then "${pkgs.zsh}/bin/zsh"
    else "${pkgs.bashInteractive}/bin/bash";
  # Font
  terminal.font = "${pkgs.maple-mono-NF}/share/fonts/truetype/MapleMono-NF-Regular.ttf";

  # Home manager
  home-manager = {
    backupFileExtension = "home-manager.bak";
    useGlobalPkgs = true;
    config = .././home;
  };
}
