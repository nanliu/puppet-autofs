# Class: autofs
#
# This module manages autofs
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class autofs(){
  include concat::setup

  package { 'autofs':
    ensure => installed,
  }

  concat { '/etc/auto.master':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['autofs'],
  }

  service { 'autofs':
    ensure    => running,
    hasstatus => true,
    subscribe => Concat['/etc/auto.master'],
  }
}
