# # This is your home-manager configuration file
# # Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
# {
#   inputs,
#   outputs,
#   lib,
#   config,
#   pkgs,
#   ...
# }: {
#   # You can import other home-manager modules here
#   imports = [
#     # If you want to use modules your own flake exports (from modules/home-manager):
#     # outputs.homeManagerModules.example
#
#     # Or modules exported from other flakes (such as nix-colors):
#     # inputs.nix-colors.homeManagerModules.default
#
#     # You can also split up your configuration and import pieces of it here:
#     # ./nvim.nix
#   ];
#
#   home = {
#     username = "roberte777";
#     homeDirectory = "/home/roberte777";
#   };
#
#   # home.packages = with pkgs; [ steam ];
#
#   # Enable home-manager and git
#   programs.home-manager.enable = true;
#   programs.git.enable = true;
#     programs.packages = with pkgs; [
#         tmux
#
#     ];
#
#   # Nicely reload system units when changing configs
#   systemd.user.startServices = "sd-switch";
#
#   # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
#   home.stateVersion = "24.11";
# }
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

  home.packages = with pkgs; [steam tmux jetbrains-mono ghostty];

  fonts.fontconfig.enable = true;

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
