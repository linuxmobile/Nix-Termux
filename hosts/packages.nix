pkgs:
with pkgs; [
  android-tools
  aria2
  curl
  fastfetch
  gawk
  git
  gnugrep
  gnupg
  gnused
  iproute2
  libarchive
  man
  maple-mono-NF
  ncurses
  nix-index
  openssh
  perl
  pigz
  tzdata
  zstd
  (nerdfonts.override {
    fonts = ["DroidSansMono"];
  })
]
