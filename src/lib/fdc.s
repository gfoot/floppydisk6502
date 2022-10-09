; 6502 Homebrew Floppy Disk Controller driver code

; Bits for use with fdc_ctl
FDC_CTL_MOTORON = 1
FDC_CTL_DIR = 2
FDC_CTL_STEP = 4
FDC_CTL_SS1 = 8


; Bits for use with fdc_status
FDC_STATUS_T0 = 1
FDC_STATUS_IDX = 2
FDC_STATUS_BYTE = 4


; Memory-mapped registers
fdc_ctl = $4000         ; Write-only control register, with bits defined by FDC_CTL_*
fdc_status = $4001      ; Read-only status register, with bits defined by FDC_STATUS_*
fdc_clock = $4002       ; Register for reading clock bytes from the FDC
fdc_data = $4003        ; Regsiter for reading data bytes from the FDC


; Various zero-page storage locations
ZP_FDC_TRACK = $40
ZP_FDC_CRC = $41
ZP_FDC_ADDR = $43
ZP_FDC_INDEX = $45
ZP_FDC_IDFIELD_TRACK = $46
ZP_FDC_IDFIELD_HEAD = $47
ZP_FDC_IDFIELD_SECTOR = $48
ZP_FDC_IDFIELD_SIZE = $49
ZP_FDC_ERROR = $4a
ZP_FDC_MAXSECTORSTOSCAN = $4b
ZP_FDC_LASTINDEX = $4c
ZP_FDC_NUMSECTORSFOUND = $4d


; Constants used to detect the starts of fields on the disk
FDC_ADDRESSMARK = $c7
FDC_FIELDTYPE_DATA = $fb
FDC_FIELDTYPE_ID = $fe


; Error codes
FDC_ERROR_CLOCK = 1     ; Some clock bits were incorrect while reading from the disk
FDC_ERROR_CRC = 2       ; The CRC of a field was incorrect after reading from the disk
FDC_ERROR_TRACK = 3     ; The track number within an ID field didn't match ZP_FDC_TRACK


; Initialize the FDC controller driver
fdc_init:
  ldy #0
  sty fdc_ctl
  sty ZP_FDC_ERROR

  ; Default to a high but positive track number, so that any future seeks will step inwards rather than outwards
  ldy #127
  sty ZP_FDC_TRACK
  rts


; Select the drive and turn on the motor
fdc_motoron:
  lda #FDC_CTL_MOTORON
  sta fdc_ctl
  rts

; Deselect the drive and turn off the motor
fdc_motoroff:
  lda #0
  sta fdc_ctl
  rts


; Read a byte of FM-encoded data from the disk
;
; On exit: X = clock byte, A = data byte
fdc_read_byte:

  lda #FDC_STATUS_BYTE

  ; Wait until "byte" is low
fdc_read_byte_wait_notbyte:
  bit fdc_status
  bne fdc_read_byte_wait_notbyte

  ; Wait until "byte" is high, so we find the leading edge
fdc_read_byte_wait_byte:
  bit fdc_status
  beq fdc_read_byte_wait_byte

  ; Read the clock into X and data into A and return
  lda fdc_data
  ldx fdc_clock
  rts



; Step the drive head up, towards the inside of the disk
fdc_step_in:
  inc ZP_FDC_TRACK
  lda #FDC_CTL_MOTORON | FDC_CTL_DIR | FDC_CTL_STEP
  bne fdc_do_step

; Step the drive head down, towards the outside of the disk
fdc_step_out:
  dec ZP_FDC_TRACK
  lda #FDC_CTL_MOTORON | FDC_CTL_STEP

; Helper to perform a step operation with correct timings
fdc_do_step:
  sta fdc_ctl
  eor #FDC_CTL_STEP
  nop                  ; ensure 1us between stores - this nop gives 8 cycles, at 6.3MHz
  sta fdc_ctl

  ; ensure >8ms before any subsequent step operation
  jsr fdc_delay_8ms

  ; Check for track 0 signal from the drive
  lda fdc_status
  and #FDC_STATUS_T0
  bne fdc_not_track0

  ; If the drive says we're on track zero, store zero in our track variable
  sta ZP_FDC_TRACK

fdc_not_track0:
  rts


; Seek to track zero
fdc_seek_track0:
  jsr fdc_step_out
  bne fdc_seek_track0
  rts


; Seek to a specific track
;
; A = track to seek to
fdc_seek:
  cmp #0
  beq fdc_seek_track0

  ; We just go one at a time, stepping in whichever direction will get us where we need to be
fdc_seek_loop:
  cmp ZP_FDC_TRACK
  bmi fdc_seek_step_out
  bne fdc_seek_step_in

  rts

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



; Debug routine to display some status information about the FDC
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
  bcc show_fdc_status_not_byte
  pha
  jsr vid_printstringimm
  .asciiz "BYTE "
  pla
show_fdc_status_not_byte:
  rts



fdc_delay_8ms:
  ; At 6.3MHz, 8ms is 50350 cycles
  ldy #40
fdc_delay_loop_outer:
  ldx #252
fdc_delay_loop_inner:
  dex
  bne fdc_delay_loop_inner
  dey
  bne fdc_delay_loop_outer
  rts


; Initialize the CRC calculator - the floppy disk CRC16 requires the two-byte CRC accumulator 
; to be initialized to $ffff
fdc_crc_init:
  lda #$ff
  sta ZP_FDC_CRC
  sta ZP_FDC_CRC+1
  rts


; CRC16 code based on that of J.G.Harston - https://mdfs.net/Info/Comp/Comms/CRC16.htm
fdc_crc_byte:
  eor ZP_FDC_CRC+1
  ldx #8
fdc_crc_byte_loop:
  asl ZP_FDC_CRC
  rol
  bcc fdc_crc_byte_notset
  eor #$10
  tay
  lda ZP_FDC_CRC
  eor #$21
  sta ZP_FDC_CRC
  tya
fdc_crc_byte_notset:
  dex
  bne fdc_crc_byte_loop
  sta ZP_FDC_CRC+1
  rts


; After consuming all the data, plus the two-byte CRC, the output CRC should be zero
fdc_crc_check:
  lda ZP_FDC_CRC
  ora ZP_FDC_CRC+1
  bne fdc_crc_check_fail
  rts

fdc_crc_check_fail:
  jmp fdc_error_crc



; Read the next ID field from the disk
fdc_read_id_field:
  jsr fdc_crc_init

  ; Read bytes until we see the correct address mark and field type
fdc_read_id_field_loop:
  jsr fdc_read_byte
  cpx #FDC_ADDRESSMARK
  bne fdc_read_id_field_loop
  cmp #FDC_FIELDTYPE_ID
  bne fdc_read_id_field_loop

fdc_read_id_field_afteraddressmark:
  jsr fdc_crc_byte                   ; CRC the field type

  jsr fdc_read_byte                  ; Read the next byte
  inx                                ; The clock byte should have been $ff,
  bne fdc_error_clock                ; so incrementing it should wrap to zero

  sta ZP_FDC_IDFIELD_TRACK           ; First byte of ID field is the track number

  cmp ZP_FDC_TRACK                   ; Check it matches which track we think we're on
  bne fdc_error_track

  jsr fdc_crc_byte                   ; CRC the track number

  jsr fdc_read_byte                  ; Read another byte
  inx
  bne fdc_error_clock                ; Check the clock byte was $ff

  sta ZP_FDC_IDFIELD_HEAD            ; The second byte is the head number
  jsr fdc_crc_byte

  jsr fdc_read_byte
  inx
  bne fdc_error_clock

  sta ZP_FDC_IDFIELD_SECTOR          ; Third byte is sector number
  jsr fdc_crc_byte

  jsr fdc_read_byte
  inx
  bne fdc_error_clock

  sta ZP_FDC_IDFIELD_SIZE            ; Fourth byte is size code - size = 2<<(code+7)
  jsr fdc_crc_byte

  ; fall through

fdc_read_crc_and_check:
  jsr fdc_read_byte                  ; Read the first CRC byte from the disk
  jsr fdc_crc_byte                   ; Pass it to the CRC calculator
  jsr fdc_read_byte                  ; Read the second CRC byte
  jsr fdc_crc_byte                   ; Pass it to the CRC calculator
  jmp fdc_crc_check                  ; Let the CRC calculator check the result was zero


; Find a specific ID field on the disk
;
; A = desired sector number
fdc_find_id_field:
  pha                           ; Preserve A
  jsr fdc_read_id_field         ; Read the next ID field
  pla
  cmp ZP_FDC_IDFIELD_SECTOR     ; Was it the right one?
  bne fdc_find_id_field         ; If not, loop
  rts


; Read a specific sector from the disk
;
; A = desired sector number
; ZP_FDC_ADDR points at a memory buffer to store the data in
fdc_read_sector:

  jsr fdc_find_id_field         ; First find the sector's ID field
  ; fall through

; Read the next data field from the disk
;
; ZP_FDC_ADDR points at a memory buffer to store the data in
fdc_read_data_field:
  jsr fdc_crc_init                       ; Reset the CRC calculator

  ldy #0
  sty ZP_FDC_INDEX                       ; This will track how many byte we've read

fdc_read_data_field_find_loop:
  jsr fdc_read_byte                      ; Read bytes until...

  cpx #FDC_ADDRESSMARK                   ; ... we find an address mark...
  bne fdc_read_data_field_find_loop

  cmp #FDC_FIELDTYPE_DATA                ; ... with the field type for a data field
  bne fdc_read_data_field_find_loop

fdc_read_data_field_loop:
  jsr fdc_crc_byte                       ; crc the previous byte

  jsr fdc_read_byte                      ; read the next byte

  inx                                    ; check the clock was $ff
  bne fdc_error_clock

  ldy ZP_FDC_INDEX
  sta (ZP_FDC_ADDR),y                    ; store the byte

  inc ZP_FDC_INDEX                       ; advance the index pointer
  bne fdc_read_data_field_loop           ; loop if it didn't wrap yet

  jsr fdc_crc_byte                       ; crc the final byte

  jmp fdc_read_crc_and_check             ; check the crc


; Clear error state
fdc_clearerror:
  lda #0
  sta ZP_FDC_ERROR
  rts

; Register a clock error
fdc_error_clock:
  lda #FDC_ERROR_CLOCK
  sta ZP_FDC_ERROR
  rts

; Register a CRC error
fdc_error_crc:
  lda #FDC_ERROR_CRC
  sta ZP_FDC_ERROR
  rts

; Register a track mismatch error
fdc_error_track:
  lda #FDC_ERROR_TRACK
  sta ZP_FDC_ERROR
  rts


; Report the last error
fdc_reporterror:
  lda ZP_FDC_ERROR
  beq fdc_reporterror_none

  cmp #FDC_ERROR_CLOCK
  beq fdc_reporterror_clock

  cmp #FDC_ERROR_CRC
  beq fdc_reporterror_crc

  cmp #FDC_ERROR_TRACK
  beq fdc_reporterror_track

  jsr vid_printstringimm
  .asciiz "FDC unknown error code "
  lda ZP_FDC_ERROR
  jsr vid_printhex
  jmp fdc_reporterror_done

fdc_reporterror_none:
  rts

fdc_reporterror_clock:
  jsr vid_printstringimm
  .asciiz "FDC clock error"
  jmp fdc_reporterror_done

fdc_reporterror_crc:
  jsr vid_printstringimm
  .asciiz "FDC CRC error"
  jmp fdc_reporterror_done

fdc_reporterror_track:
  jsr vid_printstringimm
  .asciiz "FDC track error"
  jmp fdc_reporterror_done

fdc_reporterror_done:
  lda #0
  sta ZP_FDC_ERROR
  jmp vid_textpos_newline


; Scan the current track for valid sector ID fields and store the sector numbers
;
; A = maximum number of sectors to find
; ZP_FDC_ADDR points to a buffer in which to store the resulting sector numbers
fdc_scan_sectors:

  sta ZP_FDC_MAXSECTORSTOSCAN

  lda #0
  sta ZP_FDC_NUMSECTORSFOUND

  ; Wait for the leading edge of the index pulse - bearing in mind that the signal is inverted
  lda #FDC_STATUS_IDX  
.indexloop1
  bit fdc_status
  beq .indexloop1
.indexloop2
  bit fdc_status
  bne .indexloop2

  ; Record that we're currently inside an index pulse
  lda #0
  sta ZP_FDC_LASTINDEX

  ; Find ID fields, watching out for another leading edge of the index pulse
.loop

  jsr fdc_clearerror

  jsr fdc_crc_init

.findidfieldsloop
  jsr fdc_read_byte
  cpx #FDC_ADDRESSMARK
  bne .notidfieldaddressmark
  cmp #FDC_FIELDTYPE_ID
  beq .gotidfield
  
.notidfieldaddressmark

  ; check for rising edge on index pulse
  lda fdc_status
  and #FDC_STATUS_IDX
  cmp ZP_FDC_LASTINDEX
  beq .findidfieldsloop

  ; index pulse state has changed, record the new value
  sta ZP_FDC_LASTINDEX

  ; if it's not zero then we haven't yet observed a full rotation of the disk, so keep looping
  cmp #0
  bne .findidfieldsloop

.done
  ; we're done - return the number of sector IDs found in A
  lda ZP_FDC_NUMSECTORSFOUND
  rts

.gotidfield
  ; We found an ID field - chain to the shared code to read it and check its CRC
  jsr fdc_read_id_field_afteraddressmark

  ; If there was an error, ignore it and look for another ID field
  lda ZP_FDC_ERROR
  bne .loop

  ; Log the sector
  lda ZP_FDC_IDFIELD_SECTOR
  ldy ZP_FDC_NUMSECTORSFOUND
  sta (ZP_FDC_ADDR),y
 
  ; Increase the number of sectors found and stop looping if we reached the limit
  iny
  sty ZP_FDC_NUMSECTORSFOUND
  cpy ZP_FDC_MAXSECTORSTOSCAN
  beq .done

  jmp .loop


