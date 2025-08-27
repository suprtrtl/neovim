{
  description = "My Neovim Config Flake";

  outputs = {self}: {
    defaultPackage.x86_64-linux = self;
  };
}
