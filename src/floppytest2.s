  .org $8000

  .include lib/vga.s
  .include lib/random.s
  .include lib/lcd.s
  .include lib/via.s
  .include lib/hwconfig.s
  .include lib/fdc.s

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

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  jsr seektest

  lda #10
  jsr fdc_seek

loop
  jsr readtest
  jsr prompt_wait_button
  jmp loop


seektest:
  lda #0
  jsr fdc_seek
  jsr show_fdc_status
  jsr vid_textpos_newline

  lda #79
  jsr fdc_seek
  jsr show_fdc_status
  jsr vid_textpos_newline

  lda #24
  jsr fdc_seek
  jsr show_fdc_status
  jsr vid_textpos_newline

  lda #62
  jsr fdc_seek
  jsr show_fdc_status
  jsr vid_textpos_newline

  lda #1
  jsr fdc_seek
  jsr show_fdc_status
  jsr vid_textpos_newline

  lda #0
  jsr fdc_seek
  jsr show_fdc_status
  jsr vid_textpos_newline

  jmp prompt_wait_button


readtest:
ZP_INDEX = $80
BUFFER = $2000
COUNT = 11

  ldy #0
  sty ZP_INDEX

readtestloop:
  jsr fdc_read_byte
  cpx #$c7             ; check for address mark signature in clock byte
  bne readtestloop

readtestloop2:
  ; store the clock and data and read 10 more bytes
  ldy ZP_INDEX
  sta BUFFER+COUNT+1,y
  txa
  sta BUFFER,y
  iny
  sty ZP_INDEX
  cpy #COUNT
  beq readtestloop2_done

  ; read another byte and loop
  jsr fdc_read_byte
  jmp readtestloop2

readtestloop2_done:

  ; Display all the bytes on the screen

  ldy #0
readtest_dispclkbytes_loop:
  sty ZP_INDEX
  lda BUFFER,y
  jsr vid_printhex
  inc ZP_TEXTPOS_X
  ldy ZP_INDEX
  iny
  cpy #COUNT
  bne readtest_dispclkbytes_loop

  jsr vid_textpos_newline

  ldy #0
readtest_dispdatabytes_loop:
  sty ZP_INDEX
  lda BUFFER+COUNT+1,y
  jsr vid_printhex
  inc ZP_TEXTPOS_X
  ldy ZP_INDEX
  iny
  cpy #COUNT
  bne readtest_dispdatabytes_loop

  jsr vid_textpos_newline

  rts




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
