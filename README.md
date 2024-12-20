[![Donate!][donate github]][github sponsors link]

# Ardutooling

This repository provides all the required tooling for the [ArduPilot] project. It's structured as a collection of Nix expressions, similar to what is done in [`nixpkgs`]. It is based on the [`my-own-nixpkgs`] template.

[ardupilot]: https://ardupilot.org/
[`nixpkgs`]: https://github.com/NixOS/nixpkgs
[`my-own-nixpkgs`]: https://github.com/drupol/my-own-nixpkgs

## Usage

### Setting Up

1. Install [Nix]
2. Setup [Cachix], a binary cache
3. Setup [`direnv`], for automatic handling shell environments
4. Install the [`nix-direnv`] plugin

[Nix]: https://nixos.org/download/
[Cachix]: https://cachix.org/
[`direnv`]: https://direnv.net/
[`nix-direnv`]: https://github.com/nix-community/nix-direnv

### Setup a new development environment

Scaffold a project with the flake template.

### Integrating Your Repository as an Overlay

To use this repository as an overlay in another project, follow these steps:

1. **Add the Repository as an Input**:

   Add the following to your `Flake.nix` file to include this repository as an input:

   ```nix
   inputs = {
    ardutooling.url = "github:tarc/ardutooling";
   };
   ```

2. **Include the Overlay in `pkgs`**:

   When constructing `pkgs`, include the overlay as follows:

   ```nix
   pkgs = import inputs.nixpkgs {
     overlays = [
       inputs.ardutooling.overlays.default
     ];
   };
   ```

3. **Use Your Packages**:

   Access the packages in your project like this:

   ```nix
   buildInputs = [ pkgs.example1 pkgs.example2 ];
   ```

[RFC140]: https://github.com/NixOS/rfcs/pull/140

### Examples

Refer to the dummy projects `example1` and `example2` for practical examples of
how packages can be structured.

## Going further

- Use the continuous integration service of your choice to build and test your
  packages
- Add a binary cache to your repository to speed up builds and avoid
  recompilation using [Cachix](https://cachix.org/)
- This project uses a flake framework, we recommend to use [flake-parts](https://flake.parts)

## Contributing

Feel free to contribute by sending pull requests. We are a usually very
responsive team and we will help you going through your pull request from the
beginning to the end.

For some reasons, if you can't contribute to the code and willing to help,
sponsoring is a good, sound and safe way to show us some gratitude for the hours
we invested in this package.

Sponsor me on [Github][github sponsors link] and/or any of [the
contributors][6].

[donate github]: https://img.shields.io/badge/Sponsor-Github-brightgreen.svg?style=flat-square
[github sponsors link]: https://github.com/sponsors/tarc
[6]: https://github.com/tarc/ardutooling/graphs/contributors
