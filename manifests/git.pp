class mlpuppet::git(
		$future_parser = false,
) {
	file { "/etc/puppet/repo/hooks/update":
		content => template("mlpuppet/etc/puppet/repo/hooks/update"),
		mode    => "0555";
	}
}
