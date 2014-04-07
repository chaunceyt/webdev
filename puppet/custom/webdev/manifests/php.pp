class webdev::php (
  $php_modules = ['gd', 'mysql', 'mcrypt', 'cli'],
  $drush_version = '6.2.0.0',
  $console_table_version = '1.1.3',
  $php_module_conf_path = '/etc/php5/conf.d/',
  $apc_shm_size = '96M',
  $tuning_template_file = 'webdev/z_php_tuning.ini.erb',
) {
  php::module { $php_modules: } ->
  php::module { 'apc':
    module_prefix => 'php-',
  } ->
  php::pear::module { 'Console_Table':
    version => $console_table_version,
    use_package => false,
  } ->
  php::pear::module { 'drush':
    version => $drush_version,
    use_package => false,
    repository => 'pear.drush.org',
  }
  # add php tuning config
  file { 'phase2_php_tuning':
    path => "${php_module_conf_path}z_php_tuning.ini",
    mode => 0644,
    content => template($tuning_template_file),
  }
}