{
  config,
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces];

    # Full configuration
    settings = {
      # General settings
      general = {
        gaps_in = "5";
        gaps_out = "10";
        border_size = "1";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = "false";
        allow_tearing = "false";
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = "10";
        active_opacity = "0.95";
        inactive_opacity = "0.95";
        shadow = {
          enabled = "true";
          range = "4";
          render_power = "3";
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = "true";
          size = "10";
          passes = "3";
          new_optimizations = "true";
          ignore_opacity = "true";
          vibrancy = "0.1696";
          noise = "0";
          brightness = "0.9";
        };
      };

      # Animation settings
      animations = {
        enabled = "true";
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Input settings
      input = {
        kb_layout = "us";
        follow_mouse = "1";
        sensitivity = "0";
        touchpad = {
          natural_scroll = "false";
        };
      };

      gestures = {
        workspace_swipe = "false";
      };

      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = "-0.5";
        }
      ];

      # Dwindle layout settings
      dwindle = {
        pseudotile = "true";
        preserve_split = "true";
      };

      # Master layout settings
      master = {
        new_status = "master";
      };

      # Miscellaneous settings
      misc = {
        force_default_wallpaper = "-1";
        disable_hyprland_logo = "false";
      };

      # Bindings
      "$mainMod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";
      "$browser" = "firefox";
      bindr = [
        "$mainMod, $mainMod_L, exec, $menu"
      ];
      bind = [
        "$mainMod, PERIOD, exec, hyprlock"
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, fullscreen"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, S, togglesplit,"
        "$mainMod, B, exec, $browser"
        "$mainMod, G, togglegroup"

        # Movement keybindings
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        "$mainMod CTRL, h, resizeactive, -50 0"
        "$mainMod CTRL, l, resizeactive, 50 0"
        "$mainMod CTRL, k, resizeactive, 0 -50"
        "$mainMod CTRL, j, resizeactive, 0 50"

        # Workspace keybindings
        "$mainMod, 1, split-workspace, 1"
        "$mainMod, 2, split-workspace, 2"
        "$mainMod, 3, split-workspace, 3"
        "$mainMod, 4, split-workspace, 4"
        "$mainMod, 5, split-workspace, 5"
        "$mainMod, 6, split-workspace, 6"
        "$mainMod, 7, split-workspace, 7"
        "$mainMod, 8, split-workspace, 8"
        "$mainMod, 9, split-workspace, 9"
        "$mainMod, 0, split-workspace, 10"

        "$mainMod SHIFT, 1, split-movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, split-movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, split-movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, split-movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, split-movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, split-movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, split-movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, split-movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, split-movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, split-movetoworkspacesilent, 10"

        "$mainMod, A, togglespecialworkspace, magic"
        "$mainMod SHIFT, A, movetoworkspace, special:magic"
        # Scroll through workspaces
        "$mainMod, mouse_down, split-cycleworkspaces, e+1"
        "$mainMod, mouse_up, split-cycleworkspaces, e-1"
      ];

      # bind mouse movements
      bindm = [
        # Mouse bindings
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Autostart commands
      "exec-once" = [
        "hyprpaper &"
        "swaync &"
        "nm-applet --indicator &"
        "systemctl --user start plasma-polkit-agent &"
      ];

      # Environment variables
      env = [
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "WLR_NO_CURSORS,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "NIXOS_OZONE_WL,1"
        "PKG_CONFIG_PATH,$HOME/.nix-profile/lib/pkgconfig"
      ];

      source = [
        "~/.config/hypr/monitors.conf"
      ];
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "${config.home.homeDirectory}/nix-config/.dotfiles/wallpapers/CatppuccinMocha-Kurzgesagt-AsteroidMiner.png";
        blur_passes = 2;
        contrast = 1.0;
        brightness = 0.5;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };
      input-field = {
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.2)";
        fade_on_empty = false;
        rounding = -1;
        check_color = "rgb(204, 136, 34)";
        placeholder_text = ''<i><span foreground="#cdd6f4">Input Password...</span></i>'';
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };
      label = [
        {
          text = ''cmd[update:1000] echo "$(date +\"%A, %B %d\")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        {
          text = ''cmd[update:1000] echo "$(date +\"%-I:%M\")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${config.home.homeDirectory}/nix-config/.dotfiles/wallpapers/CatppuccinMocha-Kurzgesagt-CloudyQuasar1.png"
      ];
      wallpaper = [
        ",${config.home.homeDirectory}/nix-config/.dotfiles/wallpapers/CatppuccinMocha-Kurzgesagt-CloudyQuasar1.png"
      ];
      splash = false;
    };
  };
}
