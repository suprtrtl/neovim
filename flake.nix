{
  description = "My Neovim Config Flake";

  outputs = {
    self,
    nixpkgs,
  }: {
    packages.x86_64-linux = {
      defualt = nixpkgs.lib.makeWrapper {
        name = "nvim-config";
        paths = [./.];
      };
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.default;
  };
}
