# nix-conf
flake and .nix files

```bash
sudo nixos-rebuild switch
```
Create backup copuy of *.nix file
sudo mv /etc/nixos /etc/nixos.bak  # Backup the original configuration
sudo ln -s /etc/nixos.bak/hardware-configuration.nix /etc/nixos/hardware-configuration.nix


Link *.nix files managed in git to /etc/nixos
sudo ln -s ~/Documents/nix-conf/ /etc/nixos
```shell
# Update flake.lock
nix flake update

# Or replace only the specific input, such as home-manager:
nix flake lock --update-input home-manager

# Apply the updates
sudo nixos-rebuild switch --flake .
```
