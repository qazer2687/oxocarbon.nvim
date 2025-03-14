{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      pkgsFor = system: import nixpkgs {
        inherit system;
        overlays = [ (import "${nixpkgs}/pkgs/misc/vim-plugins/vim-utils.nix") ];
      };
    in {
      packages = builtins.listToAttrs (map (system: {
        name = system;
        value = (pkgsFor system).callPackage ./default.nix { src = self; };
      }) systems);
    };
}
