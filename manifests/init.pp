# == Class: sonarr
#
class sonarr (
  $manage_epel         = $sonarr::params::manage_epel,
  $install_mono        = $sonarr::params::install_mono,
  $mono_baseurl        = $sonarr::params::mono_baseurl,
  $mono_gpgkey         = $sonarr::params::mono_gpgkey,
  $mono_packages       = $sonarr::params::mono_packages,
  $additional_packages = $sonarr::params::additional_packages,
  $user                = $sonarr::params::user,
  $group               = $sonarr::params::user,
  $base_path           = $sonarr::params::base_path,
  $install_path        = $sonarr::params::install_path,
  $config_folder       = $sonarr::params::config_folder,
  $app_folder          = $sonarr::params::app_folder,
  $archive_name        = $sonarr::params::archive_name,
  $archive_url         = $sonarr::params::archive_url,
  $executable          = $sonarr::params::executable,
  $service_enable      = $sonarr::params::service_enable,
  $service_name        = $sonarr::params::service_name,
) inherits sonarr::params {

  contain sonarr::install
  contain sonarr::service

  Class['sonarr::install'] ~>
  Class['sonarr::service']
}
