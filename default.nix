{ pkgs ? import <nixpkgs> {} }:

let
  gitignoreSource = import ./gitignore.nix {};

  texliveEnv = (import ./texlive.nix {}).env;

  systemDeps = with pkgs; [];
in
pkgs.stdenv.mkDerivation rec {
  name = "latex-document";

  src = gitignoreSource ./.;

  buildInputs = [ texliveEnv ] ++ systemDeps;

  buildPhase = ''
    mkdir $out
    latexmk -verbose -pdf \
      -pdflatex="pdflatex -interaction=nonstopmode -halt-on-error -shell-escape"\
      slide.tex
  '';

  installPhase = ''
    cp main.pdf $out/main.pdf
  '';
}
