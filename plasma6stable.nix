  { config, pkgs, inputs, ... }:
  {
  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  #programs.hyprland.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
