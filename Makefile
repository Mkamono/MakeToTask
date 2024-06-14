.PHONY: greet
greet:
	echo 'Hello World from Make!'


GREETING = Hello!

.PHONY: greet_var
greet-var:
	echo $(GREETING)
