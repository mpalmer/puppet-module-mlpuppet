class mlpuppet::git(
		$future_parser = false,
) {
	file {
		"/etc/puppet/repo/hooks/update":
			content => template("mlpuppet/etc/puppet/repo/hooks/update"),
			mode    => "0555";
		"/usr/local/bin/pnow":
			content => template("mlpuppet/usr/local/bin/pnow"),
			mode    => "0555";
	}
}
