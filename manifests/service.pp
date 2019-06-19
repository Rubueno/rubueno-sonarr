# == Class: sonarr::service
#
class sonarr::service (
  $service_enable = $sonarr::service_enable,
  $service_name   = $sonarr::service_name,
  $user           = $sonarr::user,
  $group          = $sonarr::user,
  $install_path   = $sonarr::install_path,
  $executable     = $sonarr::executable,
  $base_path      = $sonarr::base_path,
) {
  if $service_enable {
    include ::systemd

    systemd::unit_file { "${service_name}.service":
      content => template('sonarr/systemd.erb'),
      enable  => true,
      active  => true,
    }
  }
}
