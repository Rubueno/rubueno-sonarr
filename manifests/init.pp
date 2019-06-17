# Class: sonarr
# ===========================
#
# Full description of class sonarr here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'sonarr':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Ruben Bosch <ruben@rubuen.me>
#
# Copyright
# ---------
#
# Copyright 2019 Ruben Bosch.
#
class sonarr (
  $manage_epel = false,
  $mono        = true,
) {
  if $manage_epel { 
    package { 'epel-release':
      ensure => 'installed',
    }
  }
  if $mono {
    yumrepo { 'mono':
      ensure  => present,
      baseurl => 'http://download.mono-project.com/repo/centos/',
      gpgkey  => "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF",
    } ->
    package { 
      [
        'wget', 'mediainfo', 'libzen', 'libmediainfo',
        'curl', 'gettext', 'mono-core', 'mono-devel',
        'sqlite.x86_64', 'git', 'par2cmdline', 'p7zip',
        'unar.x86_64', 'unzip', 'tar', 'gcc',
        'python-feedparser', 'python-configobj',
        'python-cheetah', 'python-dbus', 'python-devel',
        'libxslt-devel'
      ]:
      ensure => installed,
    }
  }
}
