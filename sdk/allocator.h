#ifndef FLUENCE_C_SDK_ALLOCATOR_H
#define FLUENCE_C_SDK_ALLOCATOR_H

#include <stddef.h> // for size_t

// used by Wasm VM for byte array passing (should be exported from module)
void *allocate(size_t size);

// used by Wasm VM for freeing previous memory allocated by allocate function
void deallocate(void *ptr, size_t size);

#endif //FLUENCE_C_SDK_ALLOCATOR_H
