This folder contains the Python script for converting a suitable 640x480 image file into the packed format for writing to disk.

The Python script generates an 80-track Acorn DFS SSD file, which can be written to disk from a PC using GreaseWeazle like so:

    gw write testcard_640x480x3bpp.png.ssd --drive 0 --format acorn.dfs.ss --tracks c=0-79

