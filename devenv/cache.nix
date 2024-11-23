{ pkgs, ... }:
{
  packages = with pkgs; [ jq ];

  cachix.enable = false;

  scripts = {

    archive.exec = ''
      pushd $DEVENV_ROOT
      nix flake archive --json | jq -r '.path,(.inputs|to_entries[].value.path)'
    '';

    push.exec = ''
      pushd $DEVENV_ROOT
      nix flake archive --json | jq -r '.path,(.inputs|to_entries[].value.path)' | cachix push tarc
    '';
  };
}
