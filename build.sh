#!/bin/bash
set -e

if [ "$1" == "clean" ]; then
  rm -rf *.o *.iso
  exit
fi

nasm -f elf64 multiboot_header.asm
nasm -f elf64 boot.asm
nasm -f elf64 long_mode_init.asm
gcc -c main.c
ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o long_mode_init.o main.o
objdump -h kernel.bin
mkdir -p isofiles
mkdir -p isofiles/boot
mkdir -p isofiles/boot/grub
cp kernel.bin isofiles/boot/
grub-mkrescue -o apero.iso isofiles

if [ "$1" == "run" ]; then
   qemu-system-x86_64 -cdrom apero.iso
fi
