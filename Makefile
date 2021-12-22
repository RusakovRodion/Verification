CC=gcc
CFLAGS=-g
LDFLAGS= -lstdc++
ECHO = echo
SILENT = @

MODULES = calc

all: $(MODULES)

#a generic rule to create .o files from .cpp files (e.g. calc.cpp -> calc.o)
%.o: %.cpp
	$(SILENT) $(ECHO) "--- Compiling $<---"
	$(SILENT) $(CC) -c $(CFLAGS) $<

#define targets and their dependencies
calc: calc.o
	$(SILENT) $(ECHO) "--- Linking $@ ---"
	$(SILENT) $(CC) $^ -o $@ $(LDFLAGS)

clean:
	$(SILENT) $(ECHO) "--- Removing object files and binaries ---"
	$(SILENT) rm -f *.o 
	$(SILENT) rm -f $(MODULES)

.PHONY: clean