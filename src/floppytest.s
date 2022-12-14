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
