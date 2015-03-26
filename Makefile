SHELL	 = /bin/bash
CC	 = gcc
JC 	 = javac
JCH	 = javah
CFLAGS	 = -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux
LDFLAGS  = -shared # The default behaviour of the gcc commands when linking is to produce an executable program. It can be instructed to produce a shared library instead
TARGET 	 = libGetThreadID.so
CSOURCES = $(shell echo *.c)
JSOURCES = $(shell echo *.java)
NAMES 	 = $(basename GetThreadID.c)
RM 	 = rm -f

default: $(TARGET)

$(TARGET): $(JSOURCES:.java=.class) $(CSOURCES:.c=.h)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET) $(CSOURCES)

$(JSOURCES:.java=.class):
	$(JC) $(JSOURCES)

$(CSOURCES:.c=.h):
	$(JCH) $(NAMES)

run:
	java GetThreadID

clean:
	-${RM} ${TARGET} $(JSOURCES:.java=.class) $(CSOURCES:.c=.h) 
