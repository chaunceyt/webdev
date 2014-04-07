class webdev::php54
{
	package
	{
		"python-software-properties":
			ensure => present
	}

	exec
	{
		'add php54 apt-repo':
			command => '/usr/bin/add-apt-repository ppa:ondrej/php5-oldstable -y',
			require => [Package['python-software-properties']],
			onlyif => ['/usr/bin/test ! -f /etc/apt/sources.list.d/ondrej-php5-oldstable-precise.list']
	}
	exec
	{
		'repo update':
			command => '/usr/bin/apt-get update',
			require => [Exec['add php54 apt-repo']]
	}
}