#include <stdio.h>

typedef struct {
	char name[10];
	int age;
} Person;

void printPerson(Person);

int main() {
	Person zeb = { "Zeb", 35 };
	printPerson(zeb);
	return 0;
}

void printPerson(Person person) {
	printf("Name: %s\n", person.name);
	printf(" Age: %i\n", person.age);
}