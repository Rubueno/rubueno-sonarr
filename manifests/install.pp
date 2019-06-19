# == Class: sonarr::install
#
class sonarr::install (
  $manage_epel         = $sonarr::manage_epel,
  $install_mono        = $sonarr::install_mono,
  $mono_baseurl        = $sonarr::mono_baseurl,
  $mono_gpgkey         = $sonarr::mono_gpgkey,
  $mono_packages       = $sonarr::mono_packages,
  $additional_packages = $sonarr::additional_packages,
  $user                = $sonarr::user,
  $group               = $sonarr::user,
  $base_path           = $sonarr::base_path,
  $install_path        = $sonarr::install_path,
  $config_folder       = $sonarr::config_folder,
  $app_folder          = $sonarr::app_folder,
  $archive_name        = $sonarr::archive_name,
  $archive_url         = $sonarr::archive_url,
  $executable          = $sonarr::executable,
) {

  if $manage_epel {
    package { 'epel-release':
      ensure => 'installed',
    }
  }

  if $install_mono {
    yumrepo { 'mono':
      ensure   => present,
      baseurl  => $mono_baseurl,
      gpgkey   => $mono_gpgkey,
      gpgcheck => true,
    } ->

    package { $mono_packages:
      ensure => installed,
    }
  }

  $_additional_packages = $additional_packages ? {
    Array   => true,
    default => false,
  }

  if $_additional_packages {
    package { $additional_packages:
      ensure => installed,
    }
  }

  group { $group:
    ensure => present,
  }

  user { $user:
    ensure     => present,
    shell      => '/sbin/nologin',
    groups     => $group,
    managehome => true,
  }

  file { [ $base_path, $install_path, $config_folder, $app_folder ]:
    ensure => directory,
    owner  => $user,
    group  => $group,
  }

  archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "${archive_url}${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => "${install_path}/${executable}",
    cleanup      => true,
    require      => File[$install_path],
    user         => $user,
    group        => $group,
  } ->

  exec { 'move files to correct folder':
    command => "/usr/bin/mv ${install_path}/NzbDrone/* ${install_path}",
    creates => "${install_path}/${executable}",
  }
}
