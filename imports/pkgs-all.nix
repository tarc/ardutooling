{ ... }:
{
  perSystem =
    { final, pkgs, ... }:
    {
      packages = rec {
        default = mavproxy;
        ghostscript = final.unstable.ghostscript;
        mavproxy = final.callPackage ../pkgs/mavproxy.nix {
          inherit (final.unstable.python311Packages)
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
        pyEnv = pkgs.python3.withPackages (
          python-pkgs: with python-pkgs; [
            wheel
            future
            lxml
            numpy
            opencv4
            pymavlink
            pyserial
            pexpect
            geocoder
            flake8
            junitparser
            final.empy
            dronecan
            intelhex
            gnureadline
            setuptools
            wxpython
            billiard
            matplotlib
            pyparsing
          ]
        );
      };
    };
}
