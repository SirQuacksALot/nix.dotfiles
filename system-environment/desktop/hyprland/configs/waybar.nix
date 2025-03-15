{
  config = ''
    {
        // -------------------------------------------------------------------------
        // Global configuration
        // -------------------------------------------------------------------------

        "layer": "top",

        "position": "top",

        // If height property would be not present, it'd be calculated dynamically
        "height": 30,

        "margin-top": 10,
        "margin-right": 10,
        "margin-bottom": 0,
        "margin-left": 10,

        "modules-left": [
            "hyprland/workspaces",
            "hyprland/mode"
        ],
        "modules-center": [
            "hyprland/window"
        ],
        "modules-right": [
            "network",
            "memory",
            "cpu",
            "temperature",
            "battery",
            "tray",
            "clock#date",
            "clock#time"
        ],


        // -------------------------------------------------------------------------
        // Modules
        // -------------------------------------------------------------------------

        "battery": {
            "interval": 10,
            "states": {
                "warning": 30,
                "critical": 15
            },
            // Connected to AC
            "format": "{capacity}%  󰚥", // Icon: bolt
            // Not connected to AC
            "format-discharging": "{capacity}  {icon}%",
            "format-icons": [
                " ", // Icon: battery-full
                " ", // Icon: battery-three-quarters
                " ", // Icon: battery-half
                " ", // Icon: battery-quarter
                " "  // Icon: battery-empty
            ],
            "tooltip": true
        },

        "clock#time": {
            "interval": 1,
            "format": "   {:%H:%M:%S}",
            "tooltip": false
        },

        "clock#date": {
        "interval": 10,
        "format": "  {:%e %b %Y}", // Icon: calendar-alt
        "tooltip-format": "{:%e %B %Y}"
        },

        "cpu": {
            "interval": 5,
            "format": "   {usage}% ({load})", // Icon: microchip
            "states": {
            "warning": 70,
            "critical": 90
            }
        },

        "memory": {
            "interval": 5,
            "format": "   {}%", // Icon: memory
            "states": {
                "warning": 70,
                "critical": 90
            }
        },

        "network": {
            "interval": 5,
            "format-wifi": "  {essid} ({signalStrength}%)", // Icon: wifi
            "format-ethernet": "󰈀   {ifname}: {ipaddr}/{cidr}", // Icon: ethernet
            "format-disconnected": "⚠  Disconnected",
            "tooltip-format": "{ifname}: {ipaddr}"
        },

        "hyprland/mode": {
            "format": "<span style=\"italic\">   {}</span>", // Icon: expand-arrows-alt
            "tooltip": false
        },

        "hyprland/window": {
            "format": "{}",
            "max-length": 120
        },

        "hyprland/workspaces": {
            "all-outputs": false,
            "disable-scroll": true,
            "format": "{icon} {name}",
            "format-icons": {
                "1:www": "龜", // Icon: firefox-browser
                "2:mail": " ", // Icon: mail
                "3:editor": " ", // Icon: code
                "4:terminals": " ", // Icon: terminal
                "5:portal": " ", // Icon: terminal
                "urgent": " ",
                "focused": " ",
                "default": " "
            }
        },

        //"pulseaudio": {
        //    //"scroll-step": 1,
        //    "format": "{icon}  {volume}%",
        //    "format-bluetooth": "{icon}  {volume}% ",
        //    "format-muted": "",
        //    "format-icons": {
        //        "headphones": " ",
        //        "handsfree": "",
        //        "headset": "",
        //        "phone": " ",
        //        "portable": " ",
        //        "car": " ",
        //        "default": [" ", " "]
        //    },
        //    "on-click": "pavucontrol"
        //},

        "temperature": {
        "critical-threshold": 80,
        "interval": 5,
        "format": "{icon}  {temperatureC}°C",
        "format-icons": [
            "", // Icon: temperature-empty
            "", // Icon: temperature-quarter
            "", // Icon: temperature-half
            "", // Icon: temperature-three-quarters
            ""  // Icon: temperature-full
        ],
        "tooltip": true
        },

        "tray": {
            "icon-size": 21,
            "spacing": 10
        }

    }
  '';

  styles = ''
    /* -----------------------------------------------------------------------------
    * Keyframes
    * -------------------------------------------------------------------------- */

    @keyframes blink-warning {
        70% {
            color: white;
        }

        to {
            color: white;
            background-color: orange;
        }
    }

    @keyframes blink-critical {
        70% {
        color: white;
        }

        to {
            color: white;
            background-color: red;
        }
    }


    /* -----------------------------------------------------------------------------
    * Base styles
    * -------------------------------------------------------------------------- */

    /* Reset all styles */
    * {
        border: none;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        padding: 0;
    }

    /* The whole bar */
    #waybar {
        background: #323232;
        color: white;
        font-family: Cantarell, Noto Sans, sans-serif;
        font-size: 13px;
    }

    /* Each module */
    #battery,
    #clock,
    #cpu,
    #custom-keyboard-layout,
    #memory,
    #mode,
    #network,
    #pulseaudio,
    #temperature,
    #tray {
        padding-left: 10px;
        padding-right: 10px;
    }


    /* -----------------------------------------------------------------------------
    * Module styles
    * -------------------------------------------------------------------------- */

    #battery {
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #battery.warning {
        color: orange;
    }

    #battery.critical {
        color: red;
    }

    #battery.warning.discharging {
        animation-name: blink-warning;
        animation-duration: 3s;
    }

    #battery.critical.discharging {
        animation-name: blink-critical;
        animation-duration: 2s;
    }

    #clock {
        /* font-weight: bold; */
    }

    #cpu {
    /* No styles */
    }

    #cpu.warning {
        color: orange;
    }

    #cpu.critical {
        color: red;
    }

    #memory {
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #memory.warning {
        color: orange;
    }

    #memory.critical {
        color: red;
        animation-name: blink-critical;
        animation-duration: 2s;
    }

    #mode {
        background: #64727D;
        border-top: 2px solid white;
        /* To compensate for the top border and still have vertical centering */
        padding-bottom: 2px;
    }

    #network {
        /* No styles */
    }

    #network.disconnected {
        color: orange;
    }

    #pulseaudio {
        /* No styles */
    }

    #pulseaudio.muted {
        /* No styles */
    }

    #custom-spotify {
        color: rgb(102, 220, 105);
    }

    #temperature {
        /* No styles */
    }

    #temperature.critical {
        color: red;
    }

    #tray {
        /* No styles */
    }

    #window {
        font-weight: bold;
    }

    #workspaces button {
        border-top: 2px solid transparent;
        /* To compensate for the top border and still have vertical centering */
        padding-bottom: 2px;
        padding-left: 10px;
        padding-right: 10px;
        color: #888888;
    }

    #workspaces button.focused {
        border-color: #4c7899;
        color: white;
        background-color: #285577;
    }

    #workspaces button.urgent {
        border-color: #c9545d;
        color: #c9545d;
    }
  '';
}