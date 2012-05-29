# I am not very good at Makefiles.

INCLUDES = -I.
CFLAGS = -Wall -O3 $(INCLUDES)
CPPFLAGS = -Wall -O3 $(INCLUDES)

all: libraries

bin obj lib:
	mkdir -p $@

libraries: lib/libmalloc.a

lib/lib%.a: obj/%.c.o | lib
	$(AR) rcs $@ $^

obj/%.c.o: %.c | obj
	$(CC) -o $@ -c $^ $(CFLAGS)

clean:
	@rm -rf *~ bin lib obj
