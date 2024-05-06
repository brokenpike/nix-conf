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


    hardware = {
        opengl.enable = true;
        #nvidia.modesetting.enable = true;
    };

    # hyprland
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        #nvidiaPatches = true;
    };
 }
