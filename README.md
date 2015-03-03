This is the beginnings of an OS in Idris. At the moment it is mostly
just at the stage of booting on a bare-bones system. It can be run in
qemu, virtualbox, or maybe even real hardware. To use qemu run:

    qemu-system-i386 -kernel idrOS.bin

To boot in virtualbox, create a virtualbox machine and then use the `idrOS.iso`.

To actually build the .iso yourself you need to install a cross-compiler. I followed the directions here:

http://wiki.osdev.org/GCC_Cross-Compiler

At the moment, a majority of the code in this project comes from here:

http://wiki.osdev.org/Bare_Bones

The Idris stuff has been hacked just enough so that the RTS/kernel can
call Idris which then makes a single FFI call back into the C code.

There is currently no real memory allocation, garbage collection,
etc. It's amazing it does anything at all!