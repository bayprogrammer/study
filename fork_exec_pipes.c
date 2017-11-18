#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

/* TODO(zmd): general stuff to do:
   - makefile
   - enable all the checks and warnings possible
   - make this a more complete (albiet still pointless) program
*/

#define PIPE_READ 0
#define PIPE_WRITE 1

#define INITIAL_BUFFER_SIZE 10

// based on buffer used in dvtm
typedef struct {
	char *data;
	size_t used;
	size_t size;
} Buffer;

// TODO(zmd): my pointer math here correct?
#define Buffer_bytes_avail(buffer) (buffer->size - buffer->used)
#define Buffer_append_addr(buffer) (buffer->data + buffer->used)

Buffer* Buffer_new() {
	Buffer* buffer = (Buffer *)malloc(sizeof(Buffer));
	if (buffer) {
		buffer->data = (char *)malloc(INITIAL_BUFFER_SIZE);
		if (!buffer->data) {
			free(buffer);
			buffer = NULL;
		}
	} // else buffer null from malloc failure

	buffer->used = 0;
	buffer->size = INITIAL_BUFFER_SIZE;

	return buffer;
}

Buffer* Buffer_enlargen(Buffer *buffer) {
	if (!buffer) return NULL;

	// TODO(zmd): @Robustness, don't overflow sizes
	size_t old_size = buffer->size;
	size_t new_size = old_size *= 2;

	char *data = (char *)realloc(buffer->data, new_size);

	if (data) {
		buffer->data = data;
		buffer->size = new_size;
	} else {
		free(buffer->data);
		free(buffer);
		buffer = NULL;
	}

	return buffer;
}

Buffer* Buffer_read(Buffer *buffer, int filedes) {
	if (!buffer) return NULL;

	ssize_t nbytes_read;
	while (nbytes_read = read(filedes, Buffer_append_addr(buffer), Buffer_bytes_avail(buffer))) {
		printf("Read %i from pipe...\n", nbytes_read);
		if (nbytes_read == -1) break;  // failed to read from pipe

		buffer->used += nbytes_read;
		if (buffer->used == buffer->size) {
			printf("Must needs enlargen our buffer...\n");
			buffer = Buffer_enlargen(buffer);
			if (!buffer) {
				// couldn't increase our buffer size (buffer
				// freed and NULL now)
				break;
			}
		}
	}

	return buffer;
}

int main() {
	// TODO(zmd): read in program to launch from args?

	int filedes[2];
	int pipe_status;

	pipe_status = pipe(filedes);
	if (pipe_status == -1) {
		// TODO(zmd): error handling
	}

	int pid = fork();
	if (pid == -1) { // fork fail! ////////////////////////////////////////

		// TODO(zmd): error handling, close pipe

	} else if (pid == 0) {  // child process //////////////////////////////

		close(filedes[PIPE_READ]);
		dup2(filedes[PIPE_WRITE], STDOUT_FILENO);
		close(filedes[PIPE_READ]);

		//char *args[] = { "xsel", "-ob", NULL };
		//execvp("xsel", args);
		execvp("xsel", (char *[]) { "xsel", "-ob", NULL });

		exit(EXIT_SUCCESS);

	} else {  // main process /////////////////////////////////////////////

		close(filedes[PIPE_WRITE]);
		Buffer *buf = Buffer_read(Buffer_new(), filedes[PIPE_READ]);
		close(filedes[PIPE_READ]);

		int chd_status;
		wait(&chd_status);

		// TODO(zmd): error handling if read failed? (don't want to use
		//     buf if it's invalid?)

		if (buf && buf->size > 0 && buf->size > buf->used) {
			// TODO(zmd): @Highpriority: figure out best way to add
			//     null terminator to data string, and ensure
			//     there's enough room for it; put in function that
			//     can be called to move the nul as data is added.
			buf->data[buf->used] = '\0';

			printf("child says: %s\n", buf->data);
			exit(EXIT_SUCCESS);
		} else {
			// TODO(zmd): output to stderr, fprintf?
			// TODO(zmd): set return value to indicate failure
			printf("No worky... :(\n");
		}

		printf("Finished running child process");
		printf(" (status: %i).\n", chd_status);

	}
}