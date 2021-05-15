{ pkgs ? import <nixpkgs> {} }:

{
  env = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-medium
      enumitem
      latexmk
      textcase
      collection-basic
      collection-fontsextra
      collection-fontsrecommended
      collection-langenglish
      collection-langportuguese
      collection-latex
      collection-latexextra
      collection-mathscience
      hyphen-portuguese
      ;
  };
}
