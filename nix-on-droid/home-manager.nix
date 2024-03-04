{ config, libs, pkgs, ... }:

{
  home.stateVersion = "23.11";

  home.language = import ./home-manager/language.nix;

  home.file = import ./home-manager/file.nix config;
  
  programs.aria2 = import ./home-manager/programs/aria2.nix;

  programs.git = import ./home-manager/programs/git.nix;

  programs.oh-my-posh = import ./home-manager/programs/oh-my-posh.nix;
  
  programs.fish = import ./home-manager/programs/fish.nix;
  
  programs.command-not-found = import ./home-manager/programs/command-not-found.nix;
  
  programs.helix = import ./home-manager/programs/helix.nix;
  
  programs.yt-dlp = import ./home-manager/programs/yt-dlp.nix;

  programs.ssh = import ./home-manager/programs/ssh.nix;
}
