{ lib, stdenv, buildVimPackage }:

buildVimPackage rec {
  pname = "oxocarbon.nvim";
  version = "local";

  src = ./.;

  meta = with lib; {
    description = "A dark and light Neovim theme written in Fennel, inspired by IBM Carbon";
    homepage = "https://github.com/nyoom-engineering/oxocarbon.nvim";
    license = licenses.mit;
    maintainers = [qazer2687];
  };
}
