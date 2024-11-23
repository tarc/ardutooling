{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem =
    { config, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.self.overlays.default ];
        config = { };
      };

      overlayAttrs = config.packages // {
        previous = import inputs.previous { inherit system; };
        unstable = import inputs.unstable { inherit system; };
      };
    };
}
