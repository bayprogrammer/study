#include <stdio.h>

void outyo(int *foo) {
	printf("%i\n", *foo);
}

int main(int *argc, char *argv[]) {
	if (-1)
		printf("true\n");
	else
		printf("false\n");

	int foo = 6;
	outyo(&foo);

	int bar = 5;
	int *baz = &bar;
	printf("%i\n", *baz);
}