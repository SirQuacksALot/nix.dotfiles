{ ... }:

{
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [ gnome-bluetooth ];
}