NRSYSMOND_TAR ?= newrelic-sysmond-2.0.3.113-linux.tar.gz
NRSYSMOND_URL ?= https://download.newrelic.com/server_monitor/release/${NRSYSMOND_TAR}

clean:
	rm -rf tmp/*

build:
	cd tmp && \
	wget -c ${NRSYSMOND_URL} && \
	tar xvfz newrelic-sysmond-2.0.3.113-linux.tar.gz && \
	cp newrelic-sysmond-2.0.3.113-linux/daemon/nrsysmond.x64 ../nrsysmond/nrsysmond.x64 && \
	rm -r newrelic-sysmond-2.0.3.113-linux


.PHONY: build clean
