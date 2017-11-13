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
	// arrow syntax allows accessing members of pointer to struct
	// (automatically dereferencing the pointer)
	printf("Name: %s\n", person->name);
	printf(" Age: %i\n", person->age);
}
