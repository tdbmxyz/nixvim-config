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
    nixpkgs,
    nixvim,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    module = {
      # Explicit, since our `follows` overrides nixvim's own nixpkgs pin
      nixpkgs.source = nixpkgs;

      imports = [
        ./plugins

        ./autoCmd.nix
        ./diagnostic.nix
        ./keymaps.nix
        ./settings.nix
      ];
    };
  in {
    packages = forAllSystems (system: {
      default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit module;
      };
    });

    checks = forAllSystems (system: {
      default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule {
        inherit module;
      };
    });

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
