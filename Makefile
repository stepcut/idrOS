CROSS_COMPILER_PATH=/home/stepcut/opt/cross
SHELL := /bin/sh
PATH := $(CROSS_COMPILER_PATH)/bin:$(PATH)

all: idrOS.iso

idrOS.bin: boot.o idrOS.o rts/idris_rts.o rts/idris_kernel.o kernel.o
	i686-elf-gcc -T linker.ld -o $@ -ffreestanding -O2 -nostdlib $^ -lgcc
	@echo qemu-system-i386 -kernel $@

idrOS.iso: idrOS.bin grub.cfg
	mkdir -p isodir/boot/grub
	cp idrOS.bin isodir/boot
	cp grub.cfg isodir/boot/grub
	grub-mkrescue -o idrOS.iso isodir

boot.o: boot.s
	i686-elf-as boot.s -o boot.o

%.c: %.idr
	idris -S $^ -o $@

%.o: %.c
	i686-elf-gcc -Irts -c $^ -o $@ -std=gnu99 -ffreestanding -O2 -Wall -Wextra
