BUILDFILE = build.sh
CONFIGFILE = config.sh

.PHONY: build
build:
	./${BUILDFILE}

.PHONY: config
config:
	./${CONFIGFILE}

