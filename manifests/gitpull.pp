# Run Puppet periodically with a `git pull`.
#
# If you have your git configuration on a central server, and would like
# prefer it if your clients polled the server to get configuration
# updates, then you'll *love* this type.
#
# Access control to the central git repo is your own business; we only
# setup the cronjob and script.  You are also responsible for making sure
# that `/etc/puppet` is a git repository, and that the `origin` remote is
# pointing at the correct place.
#
# Available attributes:
#
#  * `period` (optional; string; default `"hourly"`)
#
#     How often to run Puppet.  The default, `hourly`, does exactly what it
#     says on the tin: run once an hour, on the hour.  No other values are
#     available at the moment.
#
#  * `splay` (optional; integer; default `0`)
#
#     When you've got a lot of machines, it can be a bit much to have them
#     all fire off at exactly the same moment (if nothing else, your git
#     repo server might have a minor sad).  By setting `splay` to a non-zero
#     value, this will cause the script to pause for a random period of time
#     between `0` and `splay - 1` seconds before doing the `git pull` and
#     Puppet run.  Setting this to a value larger than the periodicity of the
#     cron job won't get you anywhere good.
#
define mlpuppet::gitpull(
		$period = 'hourly',
		$splay = 0,
) {
	file { "/usr/local/sbin/mlpuppet-gitpull":
		ensure  => file,
		content => template("mlpuppet/usr/local/sbin/mlpuppet-gitpull"),
		owner   => "root",
		group   => "root",
		mode    => "0555",
	}

	cron { "mlpuppet-gitpull":
		command => "/usr/bin/flock -n /root/.mlpuppet-gitpull.lock /usr/local/sbin/mlpuppet-gitpull",
		user    => "root",
		hour    => "*",
		minute  => "0",
	}
}
