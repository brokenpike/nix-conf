{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # helix editor, use the master branch
    helix.url = "github:helix-editor/helix/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";#release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tuxedo-nixos = {
      url = "github:blitz/tuxedo-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs,home-manager, tuxedo-nixos, ... }: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.tuxedo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix

         # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
reloading the following units: dbus.service

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
            home-manager.users.scott = import ./home.nix;
            home-manager.users.caius = import ./home-caius.nix;
          }

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            tuxedo-nixos.nixosModules.default
         # { hardware.tuxedo-control-center.enable = true; }


        #{ _module.args = { inherit inputs; };}
      ];
    };
  };
}
