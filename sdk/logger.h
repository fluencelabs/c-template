#ifndef FLUENCE_C_SDK_LOGGER_H
#define FLUENCE_C_SDK_LOGGER_H

// writes provided string to Wasm VM logger
void wasm_log(const char *str, int len);

#endif //FLUENCE_C_SDK_LOGGER_H
