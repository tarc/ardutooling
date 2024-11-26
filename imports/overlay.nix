{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem =
    { config, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.self.overlays.default
          (final: prev: { previous = import inputs.previous { inherit system; }; })
        ];
        config = { };
      };

      overlayAttrs = {
        inherit (config.packages)
          conan
          empy
          ghostscript
          mavproxy
          pyEnv
          ;
        unstable = import inputs.unstable { inherit system; };
      };
    };
}
