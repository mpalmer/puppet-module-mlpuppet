class mlpuppet::git {
	file { "/etc/puppet/repo/hooks/update":
		source => "puppet:///mlpuppet/etc/puppet/repo/hooks/update",
		mode   => 0555;
	}
}
