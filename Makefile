.PHONY: greet
greet:
	echo 'Hello World from Make!'


GREETING = Hello!

.PHONY: greet-var
greet-var:
	echo $(GREETING)
