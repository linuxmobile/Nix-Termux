{
  description = "LinuDev Mobile Config Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "hm";
    };

    fenix.url = "github:nix-community/fenix/monthly";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "hm";
    };

    sss = {
      url = "github:SergioRibera/sss/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    agenix,
    fenix,
    hm,
    nix-index-db,
    nix-on-droid,
    nixpkgs,
    self,
    sss,
  }: {
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      modules = [
        ./hosts
      ];
    };
  };
}
