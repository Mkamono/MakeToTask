.PHONY: greet
greet:
	echo 'Hello World from Make!'


GREETING = Hello!

.PHONY: greet_var
greet_var:
	echo $(GREETING)
