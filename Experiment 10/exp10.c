#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/*
 * Experiment 10: Process Creation and Management using System Calls
 * Uses fork() to create a child process, getpid() to report PIDs,
 * and wait(NULL) in the parent process to synchronize execution.
 */

int main()
{
    pid_t p = fork();

    if (p < 0)
    {
        printf("Fork failed!\n");
        return 1;
    }

    if (p == 0)
    {
        // Child Process
        printf("Child PID: %d\n", getpid());
        printf("Child process is running\n");
        sleep(2);
        printf("Child process terminated\n");
        exit(0);
    }
    else
    {
        // Parent Process
        printf("Parent PID: %d\n", getpid());
        wait(NULL); // Wait for child process to terminate
    }

    return 0;
}
