{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGoModule rec {
  name = "gf";
  version = "2.8.3";

  src = pkgs.fetchFromGitHub {
    owner = "cococolanosugar";
    repo = "gf";
    #tag = "v${version}"; # maybe later
    rev = "f45a5ee302a605fbdc3e981577db181d74c0acc6";
    hash = "sha256-5yjn+/37CKIekdn/fNOp8ofRhL34ny87XnW7kqzH5Vs=";
  };

  vendorHash = "sha256-Zhf5nDLKUkOVLRZQm7ZAulJ2XrS07bxdVL0yahoj9ew=";

  modRoot = "cmd/gf";
  subPackages = [ "." ];

  ldflags = [
    "-s"
    "-w"
  ];

#  modPostBuild =''
#    go mod tidy
#    go mod vendor
#  '';


  env = {
    GOWORK = "off";   
  };


  meta = {
    description = "gf is a powerful CLI tool for building GoFrame application with convenience";
    license = pkgs.lib.licenses.mit;
    homepage = "https://goframe.org";
    mainProgram = "gf";
  };
}
