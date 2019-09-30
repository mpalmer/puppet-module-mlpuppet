define mlpuppet::gnupg_key(
		$key_id,
		$source_file,
) {
	include mlpuppet::gnupg_dir

	exec { "Import key ${title}":
		command => "/bin/cat $source_file | /usr/bin/gnupg --import",
		unless  => "/usr/bin/gnupg --list-keys | grep -q $key_id",
		environment => [
			"GNUPGHOME=/etc/puppet/gnupg",
		],
	}
}
