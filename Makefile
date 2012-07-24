CC = gcc
CFLAGS = -Wall -Werror
LDFLAGS = -lpthread
DEBUG ?= NO

ifeq (${DEBUG}, NO)
  OPTIMIZATION = -O2
else
  CFLAGS += -g
  OPTIMIZATION = -O0
endif

all: n_stress

n_stress: n_stress.o packets.o ccrc32.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(OPTIMIZATION) -o $@ *.o

%.o : %.c
	$(CC) $(CFLAGS) $(OPTIMIZATION) -c $< -o $@

clean :
	rm -f *.o n_stress

.PHONY: clean
