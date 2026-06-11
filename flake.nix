{
  description = "tdbmxyz's NixVim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.callPackage nixvim.legacyPackages.${system}.makeNixvimWithModule {
      module = {
        imports = [
          ./plugins

          ./autoCmd.nix
          ./diagnostic.nix
          ./keymaps.nix
          ./settings.nix
        ];
      };
    };
  };
}
