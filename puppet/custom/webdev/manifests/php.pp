class webdev::php (
  $php_modules = ['gd', 'mysql', 'mcrypt', 'cli'],
  $php_module_conf_path = '/etc/php5/conf.d/',
  $apc_shm_size = '96M',
  $tuning_template_file = 'webdev/z_php_tuning.ini.erb',
) {
  php::module { $php_modules: }
  ->
  php::module { 'apc':
    module_prefix => 'php-',
  }
  ->
  file { 'phase2_php_tuning':
    path => "${php_module_conf_path}z_php_tuning.ini",
    mode => 0644,
    content => template($tuning_template_file),
  }
}