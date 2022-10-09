BINFILES += bin/floppytest.out
BINFILES += bin/floppytest2.out
BINFILES += bin/floppytest3.out
BINFILES += bin/floppydump.out
BINFILES += bin/floppyimageload.out

all: $(BINFILES)

clean:
	rm -f $(BINFILES)

bin/%.out: src/%.s src/*.s src/lib/*.s
	vasm.vasm6502-oldstyle -Fbin -dotdir $< -o $@

burn/%.out: bin/%.out
	@(diff -q $< burn/burned.out 2>/dev/null && echo "Identical to last burn") || (minipro -p AT28C256E -w $< && cp -f $< burn/burned.out)

