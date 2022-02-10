SECTIONS
{
	. = 0x000000;
	.text :
	{
		*(.text)
	}
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    .bss : { *(.bss) }
    _heap_start = ALIGN(4096);
    _heap_end = 0x2000000;
}
