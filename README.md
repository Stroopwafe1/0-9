# X86_64 assembly

This is my first project written in x86_64 assembly. The reason why I'm learning this is to better understand how CPUs work.

## How to compile (Linux only)

```sh
$ yasm/nasm -f elf64 -o 0-9.o
$ ld -s -o 0-9 0-9.o
$ ./0-9
```

## Explanation of files

- 0-9: The assembled and linked binary
- 0-9_c: The compiled binary from C
- 0-9.asm: The assembly source
- 0-9.c: C source that represents the assembly source
- 0-9.elf: Assembled and linked binary with linker option (--nmagic)
- 0-9.no: The object file compiled with nasm
- 0.9.o: The object file compiled with yasm

Reason why I have so many files for the same thing. I was looking at different options and discovering how the assemblers and linkers work. Yeah, usually you wouldn't upload a binary to github in the source, but for this small project I don't care.

