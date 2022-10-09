  .org $8000

  .include lib/vga.s
  .include lib/random.s
  .include lib/lcd.s
  .include lib/via.s
  .include lib/hwconfig.s
  .include lib/fdc.s

ZP_TRACK = $80
ZP_SECTOR = $81
ZP_NUMSECTORS = $82

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
  .asciiz "Floppy Disk Dumper"

  jsr vid_textpos_newline

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  jsr fdc_motoron

  jsr fdc_seek_track0

  lda #0
  sta ZP_TRACK

.trackloop:
  jsr calc_textpos_for_track

  jsr vid_printstringimm
  .asciiz "T"

  lda ZP_TRACK
  jsr vid_printhex

  lda ZP_TRACK
  jsr fdc_seek

  lda #<BUFFER
  sta ZP_FDC_ADDR
  lda #>BUFFER
  sta ZP_FDC_ADDR+1

  lda #20
  jsr fdc_scan_sectors
  sta ZP_NUMSECTORS
  
  ldx #0
  stx ZP_SECTOR

  jsr vid_printstringimm
  .asciiz " Ss: "

.sectorloop:
  ldx ZP_SECTOR
  lda BUFFER,x
  jsr vid_printhex
  inc ZP_TEXTPOS_X
  
  inc ZP_SECTOR
  lda ZP_SECTOR
  cmp ZP_NUMSECTORS
  bne .sectorloop

  inc ZP_TRACK

  lda ZP_TRACK
  cmp #80
  bne .trackloop

  jsr fdc_motoroff

stop:
  jmp stop



calc_textpos_for_track:
  ; Calculate coordinates to write text at.  Y = (track % 40) * 8, X = (track / 40) * 80
  ; (plus an offset)

  lda #8
  sta ZP_TEXTPOS_X

  lda #0
  sta ZP_TEXTPOS_Y+1
  
  lda ZP_TRACK
  cmp #40
  bcc .lowtrack

  ; Second column - subtract 40, and adjust X coordinate
  sbc #40
  ldx #88
  stx ZP_TEXTPOS_X

.lowtrack

  ; Multiply by 8
  asl
  rol ZP_TEXTPOS_Y+1
  asl
  rol ZP_TEXTPOS_Y+1
  asl
  rol ZP_TEXTPOS_Y+1

  ; Add an offset
  adc #64
  sta ZP_TEXTPOS_Y
  lda ZP_TEXTPOS_Y+1
  adc #0
  sta ZP_TEXTPOS_Y+1

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
