class mlpuppet::git {
	file { "/etc/puppet/repo/hooks/update":
		source => "puppet:///modules/mlpuppet/etc/puppet/repo/hooks/update",
		mode   => 0555;
	}
}
