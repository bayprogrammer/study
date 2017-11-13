#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

#define P_RD 0
#define P_WR 1

#define BSIZE 100

int main() {
	int filedes[2];
	int pipe_status;
	pipe_status = pipe(filedes);
	if (pipe_status == -1) {
		// TODO(zmd): error handling
	}

	int pid = fork();
	if (pid == -1) {

		// TODO(zmd): error handling

	} else if (pid == 0) {  // child process

		close(filedes[P_RD]);

		write(filedes[P_WR], "Hello, world.\n", 14);

		close(filedes[P_WR]);
		exit(EXIT_SUCCESS);

		/*
		printf("Inside child process, about to exec...");

		//char *args[] = { "ls", "-laF", NULL };
		//execvp("ls", args);
		execvp("ls", (char *[]) { "ls", "-laF", NULL });
		*/

	} else {  // main process

		close(filedes[P_WR]);

		// TODO(zmd): how is it read can populate/mutate our buf
		//     without us passing in a reference to it?
		char buf[BSIZE];
		ssize_t nbytes = read(filedes[P_RD], buf, BSIZE);

		close(filedes[P_RD]);

		// TODO(zmd): error handling if read failed? (don't want to use
		//     buf if it's invalid?)
		printf("child says: %s", buf);
		exit(EXIT_SUCCESS);

		/*
		int chd_status;
		wait(&chd_status);

		printf("Finished running child process");
		printf(" (status: %i).\n", chd_status);
		*/

	}
}