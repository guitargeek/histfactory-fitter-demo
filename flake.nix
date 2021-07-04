{
  description = "Phoebe's demo R(D*) HistFactory fitter";

  inputs = {
    root-curated.url = "github:umd-lhcb/root-curated";
    nixpkgs.follows = "root-curated/nixpkgs";
    flake-utils.follows = "root-curated/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, root-curated }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ root-curated.overlay ];
        };
      in
      {
        devShell = pkgs.mkShell {
          name = "histfactory-fitter-demo";
          buildInputs = with pkgs; [
            clang-tools # For clang-format
            clang-format-all

            # Pick your favorite version of ROOT here
            #root
            root_6_12_06
            #root_5_34_38
          ];

          shellHook = ''
            export PATH=$(pwd)/tools:$PATH
          '';
        };
      });
}
