{
  config,
  pkgs,
  ...
}: {
  imports = [];
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

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
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
    # user apps
    steam
    webcord
    # programming
    rustup
    clang
    gnumake
    cmake
  ];

  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "roberte777";
    userEmail = "rewilkes0041@gmail.com";
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
