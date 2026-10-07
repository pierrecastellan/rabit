CROSS_COMPILE = arm-none-eabi-
AS = $(CROSS_COMPILE)as
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy

MCU = cortex-m3
ASFLAGS = -mcpu=$(MCU) -mthumb
CFLAGS = -mcpu=$(MCU) -mthumb -specs=nosys.specs -nostdlib -fno-builtin
LDFLAGS = -T linker.ld -nostdlib

all: firmware.bin

startup.o: startup.s
	$(AS) $(ASFLAGS) -o $@ $<

main.o: main.c
	$(CC) $(CFLAGS) -o $@ -c $<

firmware.elf: startup.o main.o
	$(LD) $(LDFLAGS) $^ -o $@

firmware.bin: firmware.elf
	$(OBJCOPY) -O binary $< $@

clean:
	rm -f *.o *.elf *.bin
