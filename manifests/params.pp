class sonarr::params {
  $manage_epel         = true
  $install_mono        = true
  $mono_baseurl        = 'http://download.mono-project.com/repo/centos/'
  $mono_gpgkey         = 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF'
  $mono_packages       = ['mono-core', 'mono-devel']
  $additional_packages = ['wget', 'mediainfo', 'libzen', 'libmediainfo', 'curl',
                          'gettext', 'sqlite.x86_64', 'git', 'par2cmdline',
                          'p7zip', 'unar.x86_64', 'unzip', 'tar', 'gcc',
                          'python-feedparser', 'python-configobj',
                          'python-cheetah', 'python-dbus', 'python-devel',
                          'libxslt-devel']
  $user                = 'sonarr'
  $base_path           = '/opt/sonarr'
  $install_path        = '/opt/sonarr/bin'
  $config_folder       = "/home/${user}/.config"
  $app_folder          = "/home/${user}/.config/NzbDrone"
  $archive_name        = 'NzbDrone.master.tar.gz'
  $archive_url         = 'http://update.sonarr.tv/v2/master/mono/'
  $executable          = 'NzbDrone.exe'
  $service_enable      = true
  $service_name        = 'sonarr'
}
