{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    autocd = true;

    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      dev = "$HOME/Dev";
      dots = "$HOME/Dev/nixland";
      pics = "$HOME/Pictures";
      vids = "$HOME/Videos";
    };
    dotDir = ".config/zsh";

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    initExtra = ''
      # search history based on what's typed in the prompt
      autoload -U history-search-end
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      bindkey "^[OA" history-beginning-search-backward-end
      bindkey "^[OB" history-beginning-search-forward-end

      # General completion behavior
      zstyle ':completion:*' completer _extensions _complete _approximate

      # Use cache
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

      # Complete the alias
      zstyle ':completion:*' complete true

      # Autocomplete options
      zstyle ':completion:*' complete-options true

      # Completion matching control
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      zstyle ':completion:*' keep-prefix true

      # Group matches and describe
      zstyle ':completion:*' menu select
      zstyle ':completion:*' list-grouped false
      zstyle ':completion:*' list-separator '''
      zstyle ':completion:*' group-name '''
      zstyle ':completion:*' verbose yes
      zstyle ':completion:*:matches' group 'yes'
      zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
      zstyle ':completion:*:messages' format '%d'
      zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
      zstyle ':completion:*:descriptions' format '[%d]'

      # Colors
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

      # case insensitive tab completion
      zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
      zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
      zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
      zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
      zstyle ':completion:*' special-dirs true
      zstyle ':completion:*' squeeze-slashes true

      # Sort
      zstyle ':completion:*' sort false
      zstyle ":completion:*:git-checkout:*" sort false
      zstyle ':completion:*' file-sort modification
      zstyle ':completion:*:eza' sort false
      zstyle ':completion:complete:*:options' sort false
      zstyle ':completion:files' sort false

      ${lib.optionalString config.services.gpg-agent.enable ''
        gnupg_path=$(ls ${config.xdg.dataHome}/gnupg)
        export SSH_AUTH_SOCK="${config.xdg.dataHome}/gnupg/$gnupg_path/S.gpg-agent.ssh"
      ''}
    '';

    shellAliases =
      {
        installed = "nix-store --query --requisites $(readlink -f ~/.nix-profile) | cut -d- -f2- | sort | uniq | sk";
        installedall = "nix-store --query --requisites $(readlink -f ~/.nix-profile) | sk";
        cleanup = "nix-collect-garbage -d";
        listgen = "nix-on-droid generations";
        nixremove = "nix-store --gc";
        bloat = "nix path-info -Sh $(readlink -f ~/.nix-profile)";
        c = "clear";
        q = "exit";
        cleanram = "sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'";
        trimall = "sudo fstrim -va";
        temp = "cd /tmp/";

        build = "nix-on-droid -F ~/Dev/mobile build";
        switch = "nix-on-droid -F ~/Dev/mobile switch";

        # git
        g = "git";
        commit = "git add . && git commit -m";
        push = "git push";
        pull = "git pull";
        gcld = "git clone --depth";
        gco = "git checkout";
        gitgrep = "git ls-files | rg";
        gitrm = "git ls-files --deleted -z | xargs -0 git rm";

        cat = "bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never";
        cp = "cp -iv";
        du = "du-dust";
        fcd = "cd $(fd --type d | sk)";
        fm = "yazi";
        grep = "rg";
        l = "eza -lF --time-style=long-iso --icons";
        la = "eza -lah --tree";
        ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
        m = "mkdir -p";
        mv = "mv -iv";
        rm = "rm -iv";
        tmusic = "termusic";
        tree = "eza --tree --icons --tree";

        # youtube-dl
        ytmp3 = "yt-dlp --ignore-errors -x --audio-format mp3 -f bestaudio --audio-quality 0 --embed-metadata --embed-thumbnail --output '%(title)s.%(ext)s'";
      }
      // lib.optionalAttrs (config.programs.bat.enable == true) {cat = "bat";};
    shellGlobalAliases = {eza = "eza --icons --git";};
  };
}
