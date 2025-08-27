{
  description = "My Neovim Config Flake";

  outputs = {self}: {
    defualtPackage.x86_64-linux = self;
  };
}
