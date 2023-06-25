{
  description = "nixconf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts-packages = {
      url = "github:paranormal775566/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, haumea, home-manager, apple-fonts-packages, ... }:
    let
      system = "x86_64-linux";
      inherit (nixpkgs.lib) genAttrs nixosSystem;

      settings = { pkgs, ... }@args: haumea.lib.load {
        src = ./settings;
        inputs = args // {
          inherit inputs;
          apple-fonts = apple-fonts-packages.packages.${system};
        };
        transformer = haumea.lib.transformers.liftDefault;
      };
    in {
      nixosConfigurations.desktop = nixosSystem {
        inherit system;
        modules = [
          settings
          ./desktop/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.admin = {
              imports = [ ./desktop/home.nix ];
	          };
          }
        ];
      };

      nixosConfigurations.laptop = nixosSystem {
        inherit system;
        modules = [
          settings
          ./laptop/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.admin = {
              imports = [ ./laptop/home.nix ];
            };
          };
        ];
      };

    };
}
