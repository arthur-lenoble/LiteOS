# Makefile
all: os-image

os-image: bootloader.bin kernel.bin
    cat $^ > os-image

bootloader.bin: boot.s
    nasm -f bin $< -o $@

kernel.bin: kernel.o
    ld -o kernel.bin -Ttext 0x1000 --oformat binary $<

kernel.o: kernel.c
    gcc -ffreestanding -c $< -o $@

clean:
    rm *.bin *.o
