#include <stdio.h>

typedef struct {
	char name[10];
	int age;
} Person;

void printPerson(Person*);

int main() {
	Person zeb = { "Zeb", 35 };
	// take address to zeb object (passing in reference rather than copy)
	printPerson(&zeb);
	return 0;
}

void printPerson(Person* person) {
	// dereference object pointed to by person, then access it's members
	printf("Name: %s\n", (*person).name);
	printf(" Age: %i\n", (*person).age);
}
