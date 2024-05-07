# nix-conf
flake and .nix files

```bash
sudo nixos-rebuild switch
```
Create backup copuy of *.nix file
sudo mv /etc/nixos /etc/nixos.bak  # Backup the original configuration

Link *.nix files managed in git to /etc/nixos
sudo ln -s ~/Documents/nix-conf/ /etc/nixos

