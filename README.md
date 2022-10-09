# Floppy Disk interface for 6502

<a href="hardware/schematic.png"><img src="hardware/schematic.png" width="350" title="Floppy Disk Controller schematic"></a>

# Source code

The source code is in the src folder and can be compiled through the Makefile, or
by running something like:

    vasm.vasm6502-oldstyle -Fbin -dotdir src/floppytest.s -o bin/floppytest.out
    vasm.vasm6502-oldstyle -Fbin -dotdir src/floppytest2.s -o bin/floppytest2.out

Some of the library files were copied from simplevga6502 to provide an
environment to test in.

# Hardware schematics

Please refer to the [hardware](hardware) folder for the Kicad project.

# Test programs

'floppytest' is the original test program that activates the drive and moves
the head around in various patterns, while printing some diagnostics on the
screen.

'floppytest2' incorporates some elements of reading data from the disk.  First
it performs some head manoeuvres to test the seek function, then each time the
button is pressed, it reads the first 10 bytes of the next field it finds on
the disk on track 10.

'floppytest3' attempts to read sectors 0-9 of a track into memory, verifying 
the CRCs etc were correct

'floppydump.s' scans all tracks of an 80-track disk for sectors and lists what
it finds

'floppyimageload.s' loads 640x480x3bpp image data from tracks 1-48 and unpacks
the data into video memory.  Each sector contains one row of the display.


# Feedback

Do let me know if you have any comments, questions, requests, or other feedback!  

