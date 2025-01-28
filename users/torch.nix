{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./common/hyprpanel.nix
    ./common/hyprland.nix
    ./common/spicetify.nix
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "roberte777";
  home.homeDirectory = "/home/roberte777";
  news.display = "silent";

  programs.zsh.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    PKG_CONFIG_PATH = "$PKG_CONFIG_PATH:$HOME/.nix-profile/lib/pkgconfig";
  };

  home.packages = with pkgs; [
    tmux
    ghostty
    jetbrains-mono
    nwg-displays
    rofi-wayland
    hyprpaper
    libnotify
    hyprlock
    wl-clipboard
    zoxide
    starship
    pyenv
    libsecret
    # user apps
    openfortivpn
    # programming
    rustup
    clang
    gnumake
    cmake
    openssl
    pkg-config
    nodePackages.prettier
    prettierd
  ];

  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "roberte777";
    userEmail = "rewilkes0041@gmail.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
    extraConfig = {
      credential = {
        credentialStore = "store";
        helper = "store";
      };
      http = {
        sslVerify = "false";
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
