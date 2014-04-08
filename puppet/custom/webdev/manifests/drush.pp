class webdev::drush (
  $drush_version = '6.2.0.0',
  $console_table_version = '1.1.3',
) {
  php::pear::module { 'Console_Table':
    version => $console_table_version,
    use_package => false,
  } ->
  php::pear::module { 'drush':
    version => $drush_version,
    use_package => false,
    repository => 'pear.drush.org',
  }
}
