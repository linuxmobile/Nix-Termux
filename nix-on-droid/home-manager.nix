{ config, libs, pkgs, ... }:

{
  home.stateVersion = "23.05";

  home.language = {
    base = "zh_CN.UTF-8";
  };

  home.file = {
    storage = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/storage/emulated/0/";
      target = "storage";
    };
  };
  
  programs.oh-my-posh = {
    enable = true;
    enableFishIntegration = true;
    useTheme = "ys";
  };
  
  programs.fish = {
    enable = true;
    shellAliases = {
      helix = "hx";
    };
  };
  
  programs.command-not-found = {  
    enable = true;
  };
  
  programs.helix = {
    enable = true;
    #defaultEditor = true;
    settings = {
      theme = "github_dark";
      editor = {
        auto-save = true;
        color-modes = true;
        indent-guides = {
          render = true;
        };
      };
    };
  };
  
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-thumbnail = true;
      embed-subs = true;
      sub-langs = "all";
      downloader = "aria2c";
      downloader-args = "aria2c: '-c -x8 -s8 -k1M'";
    };
  };
}
