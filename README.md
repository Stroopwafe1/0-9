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
- 0-9.o: The object file compiled with yasm
- 0-9.elf.noseparate: The assembled and linked binary with the option (-z noseparate-code)

Reason why I have so many files for the same thing. I was looking at different options and discovering how the assemblers and linkers work. Yeah, usually you wouldn't upload a binary to github in the source, but for this small project I don't care.

## Investigation into large binary files

I really didn't understand why, when I linked, the binary executable became 8 times larger than the object file. I would expect that they would be around the same size.

I followed [this stackoverflow post](https://stackoverflow.com/questions/67288459/elf-executable-file-many-zero-bytes), but when I used the `dumpelf` utility, it showed that the minimal allignment was still only 16 bytes as opposed to the post on stackoverflow where it showed 4096. However, someone in the comments on that post fortunately linked me to [this post](https://stackoverflow.com/questions/67275982/understanding-elf-binary-size-for-nostdlib-c-program/67277449). The advice was to link with `-z noseparate-code` which in my case really worked and got the binary file size down from 8 kB to just 992 bytes. I still don't understand why this solved my issue, but I'm glad it did.
