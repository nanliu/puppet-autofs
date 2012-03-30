include autofs

autofs::mount { 'demo':
  fs_domain => 'puppetlabs.lan',
  path      => '/home/demo',
}
