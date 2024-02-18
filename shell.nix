let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = { allowUnfree = true; }; overlays = []; };

in

pkgs.mkShell {
  packages = with pkgs; [
    git
    python311
    pkgs.pdm
  ];

  shellHook = ''
    export LC_ALL=C
    export LANG=C.utf8
  '';
}
