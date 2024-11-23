{ pkgs, ... }:
{
  packages = with pkgs; [ ];

  languages = { };

  scripts = {
    show.exec = ''
      pushd $DEVENV_ROOT
      nix flake show .# --impure "$@"
    '';

    check.exec = ''
      pushd $DEVENV_ROOT
      export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
      nix flake check .# --impure "$@"
    '';

    build.exec = ''
      pushd $DEVENV_ROOT
      nix build .#"$@"
    '';
  };
}
