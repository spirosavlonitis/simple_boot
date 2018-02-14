#define VIDEO_MEMORY 	0xb8000
#define WHITE_ON_BLACK	0x0f00
#define load_char(C)	(WHITE_ON_BLACK + C)

int print_welcome(short *,short);

int main()
{

	short kernel[] = {
	 	'a', 'n', 'd', ' ', 'P', 'r', 'i', 'n', 't', 'e', 
	 	'd', ' ', 'k', 'e', 'r', 'n', 'e', 'l', ' ',
	 	'c', 'o', 'd', 'e', '!', '!'
		
	};
	char i;
	i = 0;
	short *video_memory;
	video_memory = VIDEO_MEMORY;
	video_memory += 31;
	while ( i < 26 ) {
		*video_memory = load_char(kernel[i]);
		video_memory += 1;
		i += 1;
	}

	return 0;
}