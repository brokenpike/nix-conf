  { config, pkgs, inputs, ... }:
  {
    services.xserver = {
        enable = true;
        #videosDrivers = ["nvidia"];
        displayManager.gdm = {
            enable = true;
            wayland = true;
        };
    };
    environment.systemPackages =  with pkgs; [ waybar eww swww dunst ];

      nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    hardware = {
        opengl.enable = true;
        #nvidia.modesetting.enable = true;
    };

    # hyprland
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        #nvidiaPatches = true;
    };
 }
