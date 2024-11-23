{ ... }:
{
  perSystem =
    { pkgs, final, ... }:
    {
      packages = rec {
        default = mavproxy;
        ghostscript = final.unstable.ghostscript;
        mavproxy = pkgs.callPackage ../pkgs/mavproxy.nix {
          inherit (pkgs.unstable.python311Packages)
            buildPythonApplication
            lxml
            matplotlib
            numpy
            opencv-python
            pymavlink
            pyserial
            setuptools
            wxpython
            billiard
            gnureadline
            ;
        };
      };
    };
}
