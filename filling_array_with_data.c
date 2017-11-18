#include <stdio.h>

void fill_buffer(char *buf) {
	char *s = "Foo bar baz";
	while (*buf++ = *s++);
}

int main(int *argc, char **argv) {
	char buf[200];
	fill_buffer(buf); // implies (char *)buf ? -- not &buf (which would be char *[])

	printf("%s\n", buf);

	return 0;
}
