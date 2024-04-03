{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    default_layout "compact"
    mouse_mode true
    copy_on_select true
    simplified_ui  false
    scrollback_editor "${pkgs.helix}/bin/hx"
    pane_frames false
    on_force_close "detach"
    default_shell "${pkgs.zsh}/bin/zsh"

    ui {
      pane_frames {
        rounded_corners true
      }
    }

    themes {
      default {
         bg  "#131313"
         fg  "#ebdbb2"
         black  "#3c3836"
         red  "#ea6962"
         green  "#a9b665"
         yellow  "#d8a657"
         blue  "#7daea3"
         magenta  "#d3869b"
         cyan  "#89b482"
         white  "#d4be98"
         orange  "#3c3836"
       }
     }
  '';
}
