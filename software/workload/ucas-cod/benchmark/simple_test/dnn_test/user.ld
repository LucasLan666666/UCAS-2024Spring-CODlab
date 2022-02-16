SECTIONS
{
	. = 0x000000;
	.text : { *(.text) }
	.rodata : { *(.rodata) }
	.data : { *(.data) }
	.bss : { *(.bss) }
	. = 0x7000000;
	.input.result : { *(.input.result) }
	. = 0x8000000;
	.input.weight : { *(.input.weight) }
	. = 0x80d8f90;
	.input.data : { *(.input.data) }
}
