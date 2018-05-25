TARGET  = unsign
OUTDIR ?= bin

CC      = xcrun -sdk iphoneos cc -arch arm64
ARCHS := -arch arm64 -arch armv7
LDID    = ldid
CFLAGS  = -std=c99 -O2 -pedantic -Wall -Wextra $(ARCHS) -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
ENT = ent.plist

.PHONY: all clean

all: $(OUTDIR)/$(TARGET)

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(OUTDIR)/$(TARGET): src/*.c | $(OUTDIR)
	$(CC) -o $@ $^ $(CFLAGS)
	$(LDID) -S$(ENT) $@

clean:
	rm -f $(OUTDIR)/$(TARGET)
