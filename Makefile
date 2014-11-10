#CFLAGS = -DCEU_RUNTESTS -DCEU_DEBUG #-DSIMUL #-DCEU_DEBUG_TRAILS
#CFLAGS = -DSIMUL

all:
	ceu --cpp-args "-I . $(CFLAGS)" main.ceu
	gcc -g -Os $(CFLAGS) main.c -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx -lpthread -lm \
		-o block_jump.exe

FILES = controllers.ceu fnts.ceu main.ceu objs.ceu points.ceu snds.ceu texs.ceu

count:
	wc $(FILES)
	cat $(FILES) | grep "^ *//" | wc
	cat $(FILES) | grep "^ */\*" | wc
	cat $(FILES) | grep "^ *\*" | wc
	#cat controllers.ceu fnts.ceu main.ceu objs.ceu points.ceu snds.ceu texs.ceu | grep "^$" | wc

clean:
	find . -name "*.exe"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean
