.PHONY: greet
greet:
	echo 'Hello World from Make!'


GREETING = Hello!

.PHONY: greet-var
greet-var:
	echo $(GREETING)

LIST = "Good_Morning!", "Good_Afternoon!", "Good_Evening!"
.PHONY: greet-loop
greet-loop:
	for i in $(LIST); do \
		make -s greet-var GREETING=$$i; \
	done

.PHONY: source-and-generate
source-and-generate:
	make makefile.copy

makefile.copy: Makefile
	cp Makefile makefile.copy
