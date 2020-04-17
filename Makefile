TARGET = hello_world
CC = /bin/clang
SYSROOT = /share/wasi-sysroot
TARGET_TRIPLE = wasm32-wasi
CFLAGS = -nostartfiles -fvisibility=hidden
LDFLAGS = -Wl,--no-entry,--demangle,--allow-undefined
EXPORT_FUNCS = --export=allocate,--export=deallocate,--export=invoke
SDK = sdk/allocator.c sdk/syscalls_stubs.c
SRC = src/main.c

.PHONY: default all clean

default: $(TARGET)
all: default

$(TARGET): $(SRC) $(SDK)
	$(CC) --sysroot=$(SYSROOT) --target=$(TARGET_TRIPLE) $(CFLAGS) $(LDFLAGS) -Wl,$(EXPORT_FUNCS) $^ -o $@.wasm

.PRECIOUS: $(TARGET)

clean:
	-rm -f $(TARGET).wasm
