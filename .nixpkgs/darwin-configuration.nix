{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Keyboard
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
  system.defaults.NSGlobalDomain.KeyRepeat = 1;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false; system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  
  # Ctrl remap
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  # Trackpad
  #system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
  #system.defaults.NSGlobalDomain."com.apple.trackpad.enableSecondaryClick" = true;
  #system.defaults.NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;
  #system.defaults.NSGlobalDomain."com.apple.springing.enabled" = true;
  #system.defaults.NSGlobalDomain."com.apple.springing.delay" = 0.0;
  #system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = true;

  # Dock 
  system.defaults.dock.autohide = true;

  # Taskbar
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  # GUI
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;

  # Misc
  system.defaults.smb.NetBIOSName = "System";
  system.defaults.smb.ServerDescription = "System";
  system.defaults.screencapture.location = "/tmp";

  environment.variables.EDITOR = "nvim";

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
	environment.systemPackages =[
			pkgs.git
			pkgs.curl
			pkgs.gnupg
			pkgs.neovim
			pkgs.tmux
			pkgs.yabai
			pkgs.ncurses
			pkgs.nodejs
			pkgs.yarn
			pkgs.pwgen
			pkgs.python38
			pkgs.jupyter
			pkgs.kitty
			pkgs.docker
			pkgs.htop
			pkgs.ffmpeg
			pkgs.cargo
			pkgs.jq
			pkgs.imagemagick
			pkgs.fzf
			pkgs.fd
			pkgs.tailscale
			pkgs.skhd
			pkgs.chicken
			pkgs.youtube-dl
			pkgs.qrencode
			pkgs.git-lfs
			pkgs.go-ethereum
			pkgs.libreoffice-bin
			pkgs.testdisk
			#pkgs.urbit
			pkgs.keepassxc
			#pkgs.signal-desktop
			#pkgs.ungoogled-chromium
		];

# Use a custom configuration.nix location.
# $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
# environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

# Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
