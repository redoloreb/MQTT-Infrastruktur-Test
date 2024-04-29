CC = gcc
CFLAGS = -W -Wall -Wextra -ansi -pedantic
CPPFLAGS = 
LDFLAGS = 
LIBS = 

SRCDIR = src
BUILDDIR = build
INCDIR = include

SRC = $(shell find $(SRCDIR) -name '*.c')
OBJ = $(SRC:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

TARGET = TARGET

$(TARGET): $(OBJ)
	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^ $(LDFLAGS) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.c | $(BUILDDIR)
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $< -I$(INCDIR)

$(BUILDDIR):
	@mkdir -p $(dir $(OBJ))

.PHONY: clean

clean:
	@rm -rf $(BUILDDIR) $(TARGET)

run: $(TARGET)
	@./$(TARGET) $(ARGS)
