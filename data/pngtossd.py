# Convert a 640x480x3bpp PNG file into an Acorn DFS image file
#
# We skip the first track, then starting from the bottom of the image, encode one line per sector.
# Each line is encoded as 160 packed blue/green bytes, followed by 80 packed red bytes, with the remaining 16 bytes unused.
# Bytes within lines are store left-to-right.
#
# The blue-green packing packs four pixels into each byte, with the top four bits for green and bottom four bits for blue.
# High-order bits are leftmost pixels.
# The red packing packs eight pixels into each byte, with leftmost pixel in highest order bit.


import sys

from PIL import Image
from PIL import ImagePalette

filename = sys.argv[1]

im = Image.open(filename)


print(im.size)
print(im.getpalette())


# GIMP seems to output the colours in the wrong order sometimes, so we may need to remap them
pal = im.getpalette()

colourmap = [0] * 256

for i in range(256):

  target_index = 0

  if pal[3*i] > 128:
    target_index += 1
  if pal[3*i+1] > 128:
    target_index += 2
  if pal[3*i+2] > 128:
    target_index += 4

  colourmap[i] = target_index


def pack(bit,*v):
  r = 0
  for x in v:
    r <<= 1
    if x & bit:
      r += 1
  return r

sectors = []

for y in range(im.height):

  reddata = []
  greenbluedata = []

  for x in range(0, im.width, 4):
    v0 = colourmap[im.getpixel((x,y))]
    v1 = colourmap[im.getpixel((x+1,y))]
    v2 = colourmap[im.getpixel((x+2,y))]
    v3 = colourmap[im.getpixel((x+3,y))]

    r = pack(1, v0, v1, v2, v3)
    g = pack(2, v0, v1, v2, v3)
    b = pack(4, v0, v1, v2, v3)

    reddata.append(r)
    greenbluedata.append((g << 4) + b)

  repackedreddata = [(l<<4)+r for l,r in zip(reddata[::2], reddata[1::2])]

  sectordata = greenbluedata + repackedreddata + [0]*16

  sectors.append(sectordata)

print(len(reddata), len(greenbluedata))
print(len(sectors), len(sectors[0]))

with open(filename+".ssd", "wb") as fp:
  for sector in range(800):
    track = sector//10
    sector = sector % 10
    row = 489-10*track-sector
    if row >= 0 and row <= 479:
      fp.write(bytes(sectors[row]))
    else:
      fp.write(bytes(256))
  fp.close()

sys.exit(0)

