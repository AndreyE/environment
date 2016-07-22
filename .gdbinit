set history save on
set breakpoint pending on
set trace-commands on
set logging on
set tui border-kind space

#dpc [<count>] disassembles next (or 24 if not given) bytes starting from current location.
define dpc
  if $argc == 1
    disass $pc $pc + $arg0
  end
  if $argc == 0
    disass $pc $pc+24
  end
end

# pu <addr> print Unicode string under address
def pu
set $uni = $arg0
set $i = 0
while (*$uni && $i++<100)
  if (*$uni < 0x80)
    print *(char*)$uni++
  else
    print /x *(short*)$uni++
  end
end
end
