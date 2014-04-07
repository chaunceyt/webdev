class webdev::apache {
  apache::vhost { 'webdev-vhost':
    vhost_name      => '*',
    port            => '80',
    priority        => '00',
    docroot         => '/var/www/html',
  }

  package
  {
    "libapache2-mod-php5":
      ensure => present
  }

  apache::mod { 'php5':
	require => [Package['libapache2-mod-php5']],
  }

}