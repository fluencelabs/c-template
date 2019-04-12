TARGET = hello_world
CC = clang
SYSROOT = --sysroot=/tmp/wasi-sdk/
TARGET_TRIPLE = --target=wasm32-unknown-wasi
CFLAGS = -nostartfiles -fvisibility=hidden -Wl,--no-entry,--demangle,--allow-undefined
EXPORT_FUNCS = -Wl,--export=allocate,--export=deallocate,--export=invoke
SDK = sdk/allocator.c sdk/logger.c

.PHONY: default all clean

default: $(TARGET)
all: default

$(TARGET): main.c $(SDK)
	$(CC) $(SYSROOT) $(TARGET_TRIPLE) $(CFLAGS) $(EXPORT_FUNCS) $^ -o $@.wasm

.PRECIOUS: $(TARGET)

clean:
	-rm -f $(TARGET).wasm
