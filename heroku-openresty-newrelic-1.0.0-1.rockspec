package = "heroku-openresty-newrelic"
version = "1.0.0-1"

source = {
	url = "git://github.com/applicaster/heroku-openresty-newrelic.git"
}

description = {
	summary = "Binaries and config files to connect OpenResty running on Heroku to NewRelic",
	license = "MIT"
}

dependencies = {
	"lua >= 5.1"
}

build = {
	type = "command",
	install_command = [[
		APP_DIR=`cd $(PREFIX)/../../../../../../; pwd`
		cp -r newrelic-plugin-agent $APP_DIR
		cp -r nrsysmond $APP_DIR

		(
			cd /tmp
			wget -q https://bootstrap.pypa.io/get-pip.py
			PYTHONUSERBASE=$APP_DIR/.local python get-pip.py --user
			PYTHONUSERBASE=$APP_DIR/.local $APP_DIR/.local/bin/pip install --user  newrelic-plugin-agent
		)
	]],
	install = {
	}
}

