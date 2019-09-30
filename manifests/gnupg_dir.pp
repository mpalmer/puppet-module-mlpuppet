class mlpuppet::gnupg_dir {
	file {
		"/etc/puppet/gnupg":
			ensure  => directory,
			owner   => "root",
			group   => "root",
			mode    => "0700";
		"/etc/puppet/gnupg/options":
			ensure  => file,
			content => "# Puppet-managed\ntrust-model always\n",
			owner   => "root",
			group   => "root",
			mode    => "0400";
	}
}
