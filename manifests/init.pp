class baseusers($users = {}, $groups = {}) {

    $group_defaults = {
      ensure => 'present'
    }

    unless $groups == undef{
      create_resources(group, $groups, $group_defaults)
    }

    $user_defaults = {
      ensure => 'present',
      managehome => true,
    }

    unless $users == undef{
      create_resources(user, $users, $user_defaults)
    }
}
