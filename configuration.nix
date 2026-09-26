

{ config, pkgs, ... }:


{

nixpkgs.config.permittedInsecurePackages = [
     "olm-3.2.16"
 ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pastors-nixos";
  networking.wireless.enable = true; 


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

    

  # Enable the X11 windowing system.
  services.xserver.enable = true;

# Enable the SDDM
  # services.xserver.displayManager.sddm.enable = true;
  
  # Enable the Budgie Desktop environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.desktopManager.budgie.enable = true;

  # Enable the Cinnamon Desktop Evironment
   services.xserver.displayManager.lightdm.enable = true;
   services.xserver.desktopManager.cinnamon.enable = true;
  
  # Enable the MATE Desktop Environment
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.mate.enable = true;


  # Enable the Pantheon Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.desktopManager.pantheon.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."clorenzo" = {
    isNormalUser = true;
    description = "Christopher Lorenzo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  
  #Steam
  programs.steam.enable = true;

  #Gamemode
  programs.gamemode.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
  vim 
  git
  wget
  fastfetch
  gamemode
  protonup-qt
  calibre
  vivaldi
  libreoffice-stable
  gimp
  github-desktop
  vivaldi-ffmpeg-codecs
  kitty
  wine
  dxvk_2
  vlc
  discord
  adwsteamgtk
  nheko
  # mate-tweak
   mint-y-icons
   mint-x-icons
   mint-l-icons
  dracula-theme
  dracula-icon-theme
  gnome-keyring
  unzip
  p7zip
  caja-extensions
  gnome-disk-utility
  steamcmd
  steam-run
  shotcut  
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   



  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
