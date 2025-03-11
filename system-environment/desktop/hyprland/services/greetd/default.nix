{ pkgs, username, ... }: 
let
  inherit (import ../../conifg.nix) hyprconfig;
in
{
  configFile = pkgs.writeText "hyprland.conf" ${hyprconfig};

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --config ${configFile}"; # start Hyprland with a TUI login manager - change to service run. so other programs can a dependent service too
      };
    };
  };
}