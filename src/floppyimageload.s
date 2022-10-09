  .org $8000

  .include lib/vga.s
  .include lib/random.s
  .include lib/lcd.s
  .include lib/via.s
  .include lib/hwconfig.s
  .include lib/fdc.s

ZP_SEEKSECTOR = $80
ZP_YCOORD = $81     ; 2 bytes
BUFFER = $2000

reset:
  ldx #$ff
  txs

  jsr via_init
  jsr xvia_init
  jsr lcd_init

  jsr printimm
  .asciiz "Hello, World!"

  jsr vram_init

  jsr printimm
  .asciiz "A"

  ;jsr wait_button

  ldy #0
  sty ZP_TEXTPOS_X
  sty ZP_TEXTPOS_Y
  sty ZP_TEXTPOS_Y+1

  jsr fdc_init

  jsr vid_printstringimm
  .asciiz "Hello, World!"

  jsr vid_textpos_newline

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  jsr fdc_motoron

  jsr fdc_seek_track0

  lda #<BUFFER
  sta ZP_FDC_ADDR
  lda #>BUFFER
  sta ZP_FDC_ADDR+1

  lda #<479
  sta ZP_YCOORD
  lda #>479
  sta ZP_YCOORD+1

.trackloop:
  jsr fdc_step_in

  lda #0
  sta ZP_SEEKSECTOR

.sectorloop:
  lda ZP_SEEKSECTOR
  jsr fdc_read_sector

  ; Write the blue and green channels
  lda ZP_YCOORD+1
  ora #4
  tay
  lda ZP_YCOORD
  jsr vram_openline

  ldx #160
  ldy #160
.bluegreenxloop
  dex
  lda BUFFER,x
  dey
  sta (ZP_PTR),y
  bne .bluegreenxloop

  ; Write the red channel
  lda ZP_YCOORD+1
  ora #8
  tay
  lda ZP_YCOORD
  jsr vram_openline

  ldx #240
  ldy #160
.redxloop
  dex
  lda BUFFER,x
  and #BITS_PIXELDATA
  ora #BITS_DEFAULT

  dey
  sta (ZP_PTR),y

  lda BUFFER,x
  lsr
  lsr
  lsr
  lsr
  ora #BITS_DEFAULT

  dey
  sta (ZP_PTR),y

  bne .redxloop

  ; Next screen line
  lda ZP_YCOORD
  bne .nextlinenocarry
  dec ZP_YCOORD+1
  bmi .done
.nextlinenocarry
  dec ZP_YCOORD

  ; Next sector
  ldx ZP_SEEKSECTOR
  inx
  stx ZP_SEEKSECTOR
  cpx #10
  bne .sectorloop

  ; Next track
  jmp .trackloop

.done
  jsr fdc_motoroff

  
stop:
  jmp stop


delay_vsyncs:
  jsr wait_vsync
  dex
  bne delay_vsyncs
  rts  

wait_vsync:
  lda VIA_PORTA
  and #2
  bne wait_vsync

wait_vsync_loop2:
  lda VIA_PORTA
  and #2
  beq wait_vsync_loop2

  rts


prompt_wait_button:
  jsr vid_printstringimm
  .asciiz "Press button to continue..."
  jsr vid_textpos_newline

wait_button:
  lda PORTA
  and #1
  beq .buttonpressed
  jmp wait_button

.buttonpressed:
  ldx #0
.loop:
  dex
  beq .done
  lda PORTA
  and #1
  bne .loop
  ldx #0
  jmp .loop
.done
  rts


irq
  jsr printimm
  .asciiz "IRQ"
.dead
  jmp .dead


  .org $fffc
  .word reset
  .word $0000
