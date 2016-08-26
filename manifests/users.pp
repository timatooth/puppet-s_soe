class s_soe::users ($users = undef) {
  if !$users {
    warning('No users found from hiera for s_soe::users')
  }
  create_resources(accounts::user, $users)

  # Workaround FreeBSD admin group being called 'wheel' -.-
  if $::osfamily == 'FreeBSD' {
    accounts::user <|groups == 'admin'|> {
      groups => ['wheel']
    }
  }
}

