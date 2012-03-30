define autofs::mount(
  $fs_domain = $::domain,
  $path      = "/export/${name}"
){

  file{ "/etc/auto.${name}":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('autofs/auto.mount.erb'),
    notify  => Service['autofs'],
  }

  concat::fragment { "autofs_mount_${name}":
    target  => '/etc/auto.master',
    content => "/${name} /etc/auto.${name} tcp,nodev,nosuid",
  }

}

