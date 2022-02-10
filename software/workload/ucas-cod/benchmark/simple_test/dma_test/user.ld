SECTIONS
{
	. = 0x000000;
	.text :
	{
		*(.start)
		
		. = 0x000100;
		*(.exception)
		
		. = 0x000200;
		*(.text)
	}
	.data :
	{
		*(.data)
	}
	. = ALIGN(32);
	.bss :
	{
		*(.bss)
	}
	. = ALIGN(8192);
	_SP_START_ = .;
}
