{
  config,
  pkgs,
  ...
}: let
  browser = ["firefox"];
  imageViewer = ["viewnior"];
  videoPlayer = ["mpv"];
  audioPlayer = ["termusic"];

  xdgAssociations = type: program: list:
    builtins.listToAttrs (map (e: {
        name = "${type}/${e}";
        value = program;
      })
      list);

  image = xdgAssociations "image" imageViewer ["png" "svg" "jpeg" "gif"];
  video = xdgAssociations "video" videoPlayer ["mp4" "avi" "mkv"];
  audio = xdgAssociations "audio" audioPlayer ["mp3" "flac" "wav" "aac"];
  browserTypes =
    (xdgAssociations "application" browser [
      "json"
      "x-extension-htm"
      "x-extension-html"
      "x-extension-shtml"
      "x-extension-xht"
      "x-extension-xhtml"
    ])
    // (xdgAssociations "x-scheme-handler" browser [
      "about"
      "ftp"
      "http"
      "https"
      "unknown"
    ]);

  # XDG MIME types
  associations = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) ({
      "application/pdf" = ["org.pwmt.zathura-pdf-mupdf"];
      "text/html" = browser;
      "text/plain" = ["Helix"];
      "x-scheme-handler/chrome" = ["chromium-browser"];
    }
    // image
    // video
    // audio
    // browserTypes);
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };

  # used by `gio open` and xdp-gtk
  home.packages = [
    pkgs.xdg-utils
  ];
}
