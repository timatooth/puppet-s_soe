class s_soe::users {
  accounts::user { 'tim':
    ensure   => present,
    groups   => ['admin'],
    uid      => 4001,
    gid      => 4001,
    password => '!!',
    sshkeys  => ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCe5Y+qcWALJVmp9F9IIq2Xj83AQpeZg/02jDaZtZoeDmDbIi4EwkDnEykhJGfgQRz9JClwEoleSpbDj6U9qK8KlPj2yfg8TWDaG0WrD0LXTbELwiXMPvoOeWLD8EouM3WEIhsG8Sf07eRztaSi6OJuQlaaD79V4GSZ+NnljgJ1+31QlTUAJKX+UdR3w9bo/HW1XJFJvhGaW1Y9SyE98R8M4bstoqv0DvtmUmsf/cHgLyDMWPCXBty4uoPMAavgs5nvaUPhCPBeobENIi8rOHjzNtdJtXShFicCccEDBg7Nj6u+eG4fNlvbNVw+h3/CgYAnTUEGyejrFKnzbhmNguY1'],
  }
}

