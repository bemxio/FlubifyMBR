# constants
CC = i686-w64-mingw32-gcc
AS = nasm

CFLAGS = -Wall -Wextra -Werror -O2 -std=c11
#LIBS = 

SOURCE_DIR = src
BUILD_DIR = build

EXECUTABLE = FlubifyMBR.exe

SOURCES = $(shell find $(SOURCE_DIR) -name "*.c")
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

# targets intended to be called by the user
all: $(BUILD_DIR)/$(EXECUTABLE)

run: $(BUILD_DIR)/$(EXECUTABLE)
	@clear && $^

bootloader: $(BUILD_DIR)/bootloader.bin

# targets for internal use
$(BUILD_DIR)/$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)

$(BUILD_DIR)/bootloader.bin: $(SOURCE_DIR)/bootloader.asm
	$(AS) -f bin $^ -o $@

# rules
$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c
	mkdir -p $(dir $@)

	$(CC) $(CFLAGS) -c $^ -o $@ $(LIBS)

# other stuff
clean:
	rm -rf $(BUILD_DIR)