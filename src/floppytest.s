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
FDC_STATUS_WP = 2
FDC_STATUS_IDX = 4

fdc_ctl = $4000
fdc_status = $4000

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

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  jsr fdc_step_in
  jsr fdc_step_in
  jsr fdc_step_in
  jsr fdc_step_in

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  jsr fdc_seek_track0

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

loop1:
  jsr fdc_step_in
  
  lda ZP_FDC_TRACK
  cmp #39
  bmi loop1

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

  jsr fdc_seek_track0

  jsr show_fdc_status
  jsr vid_textpos_newline
  jsr prompt_wait_button

loop2:
  jsr fdc_step_in
  jsr show_fdc_status

  ldx #30
  jsr delay_vsyncs

  lda ZP_FDC_TRACK
  cmp #39
  bmi loop2

  ldx #30
  jsr delay_vsyncs

  jsr fdc_seek_track0
  jsr show_fdc_status

  ldx #30
  jsr delay_vsyncs

  jmp loop1


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


show_fdc_status:
  lda #0
  sta ZP_TEXTPOS_X

  jsr vid_printstringimm
  .asciiz "FDC status: track $"

  lda ZP_FDC_TRACK
  jsr vid_printhex

  jsr vid_printstringimm
  .asciiz "  flags:          "

  sec
  lda ZP_TEXTPOS_X
  sbc #9
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
  bcs show_fdc_status_not_wp
  pha
  jsr vid_printstringimm
  .asciiz "WP "
  pla
show_fdc_status_not_wp:
  ror
  bcs show_fdc_status_not_idx
  pha
  jsr vid_printstringimm
  .asciiz "IDX "
  pla
show_fdc_status_not_idx:
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
