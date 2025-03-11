{ ... }: {
  # Display Link Driver
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';
}