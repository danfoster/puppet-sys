# == Class: sys::redhat::epel
#
# Adds the EPEL repositories to the RedHat-like system.
#
class sys::redhat::epel {
  # Getting the right RPM depending on this RedHat release.
  case $::operatingsystemrelease {
    /^5\.\d+$/: {
      $epel_name = 'epel-release-5'
      $elel_rpm = "https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm"
    }
    /^6\.\d+$/: {
      $epel_name = 'epel-release-6'
      $elel_rpm = "https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm"
    }
    /^7\.[\d.]+$/: {
      $epel_name = 'epel-release-7'
      $elel_rpm = "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
    }
    default: {
      fail("Do not know how to install EPEL on RedHat release: ${::operatingsystemrelease}.\n")
    }
  }

  package { $epel_name:
    ensure   => installed,
    alias    => 'epel',
    source   => $epel_rpm,
    provider => 'rpm',
  }
}
