SUBDIRS=qpid-proton standard-controller address-controller agent mqtt-gateway mqtt-lwt router router-metrics topic-forwarder none-authservice auth-controller auth-server

all:
	for dir in $(CENTOS_SUBDIRS) $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

pushall:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir push; \
	done

snapshotall:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir snapshot; \
	done

cleanall:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done

copyartifactall:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir copyartifact; \
	done

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
#	curl -s https://raw.githubusercontent.com/EnMasseProject/travis-scripts/master/trigger-travis.sh | bash /dev/stdin

.PHONY: all $(SUBDIRS) push snapshot clean pushall snapshotall cleanall
