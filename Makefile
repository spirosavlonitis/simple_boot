C_SOURCE= $(wildcard kernel/*.c )
OBJ = ${C_SOURCE:.c=.o}

all: os-image

run: all
	qemu-system-i386 -fda os-image

os-image: boot/boot_sect.bin kernel/kernel.bin
	cat $^ > $@

%.bin: %.asm
	nasm -f bin -I "boot/" -o $@ $<

kernel/kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -Ttext 0x1000 --oformat binary -o $@ $^

%.o: %.asm
	nasm -f elf64 -o $@ $<

%.o: %.c
	gcc -ffreestanding -c $< -o $@

clean:
	rm -rf os-image boot/*.bin kernel/*.bin
	rm -rf kernel/*.o
