  .org $8000

  .include lib/vga.s
  .include lib/random.s
  .include lib/lcd.s
  .include lib/via.s
  .include lib/hwconfig.s
  .include lib/fdc.s

ZP_SEEKSECTOR = $80

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

  jsr vid_printstringimm
  .asciiz "Seeking to track 10..."
  jsr vid_textpos_newline

  lda #10
  jsr fdc_seek

  ldx #0
  stx ZP_SEEKSECTOR

  stx ZP_FDC_ADDR
  ldx #$30
  stx ZP_FDC_ADDR+1

loop:

  jsr vid_printstringimm
  .asciiz "Reading into memory sector "

  lda ZP_SEEKSECTOR
  jsr vid_printhex

  jsr vid_textpos_newline

  lda ZP_SEEKSECTOR
  jsr fdc_read_sector

  jsr fdc_reporterror

  inc ZP_SEEKSECTOR
  lda ZP_SEEKSECTOR
  cmp #10
  bne loop

  jsr vid_printstringimm
  .asciiz "Done"

  jsr fdc_motoroff

loop2:
  jmp loop2

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
