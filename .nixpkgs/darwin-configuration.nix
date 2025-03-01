{ config, pkgs, ... }:

{
	imports = [ <home-manager/nix-darwin> ];

	system.stateVersion = 5;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.defaults = {
		NSGlobalDomain = { # Key repeat
				ApplePressAndHoldEnabled = false;
				InitialKeyRepeat = 10;
				KeyRepeat = 1;
				NSAutomaticCapitalizationEnabled = false;
				NSAutomaticDashSubstitutionEnabled = false;
				NSAutomaticPeriodSubstitutionEnabled = false;
				NSAutomaticQuoteSubstitutionEnabled = false;
				NSAutomaticSpellingCorrectionEnabled = false;

				# Trackpad
				"com.apple.mouse.tapBehavior" = 1;
				"com.apple.trackpad.enableSecondaryClick" = true;
				"com.apple.trackpad.trackpadCornerClickBehavior" = 1;
				"com.apple.springing.enabled" = true;
				"com.apple.springing.delay" = 0.0;
				"com.apple.swipescrolldirection" = true;

				# Zoom
				#"com.apple.universalaccess.closeViewHotkeysEnabled" = true;

				# Autohide taskbar
				_HIHideMenuBar = true;

				# Show dotfiles et al
				AppleShowAllFiles = true;
				AppleShowAllExtensions = true;
		};

		# Networking
		smb = {
			NetBIOSName = "System";
			ServerDescription = "System";
		};

		# Set screenshot folder to /tmp
		screencapture.location = "/tmp";

		# Autohide dock
		dock = {
			autohide = true;
		};
	};

	# Ctrl/shift remap
	system.keyboard = {
		enableKeyMapping = true;
		remapCapsLockToControl = true;
	};


	# Env vars
	environment.variables.EDITOR = "nvim";

	# TODO Singal, Stubby, Wireguard, yt-dlp
	#pkgs.cargo
	#pkgs.rustc
	#pkgs.stubby
	#pkgs.urbit
	#pkgs.signal-desktop
	#pkgs.ungoogled-chromium

	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	environment.systemPackages = [
			pkgs.wget
			pkgs.libusb1
			pkgs.git
			pkgs.curl
			pkgs.gnupg
			pkgs.neovim
			pkgs.tmux
			pkgs.yabai
			pkgs.skhd
			pkgs.ncurses
			pkgs.nodejs
			pkgs.yarn
			pkgs.pwgen
			pkgs.jupyter
			pkgs.kitty
			pkgs.docker
			pkgs.htop
			pkgs.ffmpeg
			pkgs.rustup
			pkgs.jq
			pkgs.imagemagick
			pkgs.fzf
			pkgs.fd
			pkgs.tailscale
			pkgs.chicken
			#pkgs.youtube-dl
			pkgs.qrencode
			pkgs.git-lfs
			pkgs.go-ethereum
			pkgs.libreoffice-bin
			pkgs.testdisk
			pkgs.python312Packages.optimum
			pkgs.onnxruntime
			#pkgs.php
			#pkgs.keepassxc
			#pkgs.yt-dlp
			pkgs.protobuf
			pkgs.cmake
			#pkgs.conda
			#pkgs.nmap
			#pkgs.bun
			#pkgs.coreutils
			##pkgs.monero-gui
			#pkgs.go
			#pkgs.exiftool
			pkgs.exif
			#pkgs.stripe-cli
			#pkgs.ghostscript
			##pkgs.android-tools
			#pkgs.pdftk
			#pkgs.gallery-dl
			pkgs.ifuse
			pkgs.libimobiledevice
			pkgs.libimobiledevice-glue
			pkgs.libusb1
			pkgs.libirecovery
		];

	# Use a custom configuration.nix location.d
	# $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
	# environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

	# Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

	# Yabai
	#services.yabai.enable = true;

	#services.skhd.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

	#programs.git.enable = true;
	#	enableCredentialCache = false; # Disable credential caching
	#	extraConfig = {
  #    credential.helper = "";  # Disable the credential helper
  #  };
  #};
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  #system.stateVersion = 5;
}
