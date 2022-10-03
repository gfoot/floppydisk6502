  .org $8000

  .include lib/vga.s
  .include lib/random.s
  .include lib/lcd.s
  .include lib/via.s
  .include lib/hwconfig.s

FDC_CTL_MOTORON = 1
FDC_CTL_DIR = 2
FDC_CTL_STEP = 4
FDC_CTL_SS0 = 8

FDC_STATUS_T0 = 1
FDC_STATUS_IDX = 2
FDC_STATUS_BYTE = 4

fdc_ctl = $4000
fdc_status = $4001
fdc_clock = $4002
fdc_data = $4003

ZP_FDC_TRACK = $40

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

  sty ZP_FDC_TRACK

  jsr vid_printstringimm
  .asciiz "Hello, World!"

  jsr vid_textpos_newline

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  lda #FDC_CTL_MOTORON
  sta fdc_ctl

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



fdc_read_byte:
  ; Wait until "byte" is low; then wait until "byte" is high; then read the clock into X and data into A and return

  lda #FDC_STATUS_BYTE

fdc_read_byte_wait_notbyte:
  bit fdc_status
  bne fdc_read_byte_wait_notbyte

fdc_read_byte_wait_byte:
  bit fdc_status
  beq fdc_read_byte_wait_byte

  lda fdc_data
  ldx fdc_clock
  rts



fdc_step_in:
  lda #FDC_CTL_MOTORON | FDC_CTL_DIR | FDC_CTL_STEP
  sta fdc_ctl
  jsr wait_vsync
  
  lda #FDC_CTL_MOTORON | FDC_CTL_DIR
  sta fdc_ctl
  jsr wait_vsync

  inc ZP_FDC_TRACK

  rts

fdc_step_out:
  lda #FDC_CTL_MOTORON | FDC_CTL_STEP
  sta fdc_ctl
  jsr wait_vsync

  lda #FDC_CTL_MOTORON
  sta fdc_ctl
  jsr wait_vsync

  dec ZP_FDC_TRACK
  lda fdc_status
  and #FDC_STATUS_T0
  beq fdc_set_track_0

  rts

fdc_set_track_0:
  lda #0
  sta ZP_FDC_TRACK
  rts


fdc_seek_track0:
  lda fdc_status
  and #FDC_STATUS_T0
  beq fdc_seek_track0_done
  
  jsr fdc_step_out
  jmp fdc_seek_track0

fdc_seek_track0_done:
  rts


fdc_seek:
  pha
  jsr vid_printstringimm
  .asciiz "Seek to track "
  pla

  jsr vid_printhex

  pha
  jsr vid_textpos_newline
  pla

  cmp #0
  beq fdc_seek_track0
fdc_seek_loop:
  pha
  jsr show_fdc_status
  pla

  cmp ZP_FDC_TRACK
  bmi fdc_seek_step_out
  bne fdc_seek_step_in

  jmp vid_textpos_newline

fdc_seek_step_in:
  pha
  jsr fdc_step_in
  pla
  jmp fdc_seek_loop

fdc_seek_step_out:
  pha
  jsr fdc_step_out
  pla
  jmp fdc_seek_loop



show_fdc_status:
  lda #0
  sta ZP_TEXTPOS_X

  jsr vid_printstringimm
  .asciiz "FDC status: track $"

  lda ZP_FDC_TRACK
  jsr vid_printhex

  jsr vid_printstringimm
  .asciiz "  flags:             "

  sec
  lda ZP_TEXTPOS_X
  sbc #24
  sta ZP_TEXTPOS_X

  lda fdc_status
  ror
  bcs show_fdc_status_not_t0
  pha
  jsr vid_printstringimm
  .asciiz "T0 "
  pla
show_fdc_status_not_t0:
  ror
  bcs show_fdc_status_not_idx
  pha
  jsr vid_printstringimm
  .asciiz "IDX "
  pla
show_fdc_status_not_idx:
  ror
  bcs show_fdc_status_not_byte
  pha
  jsr vid_printstringimm
  .asciiz "BYTE "
  pla
show_fdc_status_not_byte:
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
