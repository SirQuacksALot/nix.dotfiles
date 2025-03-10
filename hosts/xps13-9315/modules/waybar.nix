{ config, lib, pkgs, ... }: 

#----------------------------------------------------------------
# Waybar module
#
# This is a self meade module to install an configure waybar. It's been heavaly influenced by the following.
# Source: https://github.com/nix-community/home-manager/blob/master/modules/programs/waybar.nix

let
  inherit (lib)
    all filterAttrs hasAttr isStorePath literalExpression optional optionalAttrs
    types;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf mkMerge;

  cfg = config.waybar;
in
{
  #----------------------------------------------------------------
  # Define Options
  #
  options.waybar = with lib.types; {
    # Should it be enabled ? 
    enable = mkEnableOption "waybar";

    # Package option
    package = mkOption {
      type = package;
      default = pkgs.waybar;
      defaultText = literalExpression "pkgs.waybar";
    };

    runParams = mkOption {
      type = nullOr str;
      default = "";
    };

    # Enable System service
    systemd.enable = mkEnableOption "Waybar systemd integration";

  };

  config = {
    # Install package
    environment.systemPackages = with pkgs; [
      cfg.package
    ];

    # Define service
    systemd.user.services.waybar = mkIf cfg.systemd.enable {
      enable = true; # enable newly defined service
      after = [ "wayland-session@Hyprland.target" ]; # run after hyprland session has been reached
      partOf = [ "wayland-session@Hyprland.target" ]; # made part of hyprland session service routine - will be killed if hyprland session service is stopped

      # Define what the service actually does
      serviceConfig = {
        ExecStart = "${cfg.package}/bin/waybar ${cfg.runParams}"; # run command on start
        ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID"; # run command on reload - example "systemctl reload waybar.service"
        Restart = "on-failure"; # restart events
        KillMode = "mixed";
      };

      wantedBy = [ "wayland-session@Hyprland.target" ]; # link to hyprland session service
    };
  };
}