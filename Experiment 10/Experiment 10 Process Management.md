# Experiment 10: Process Creation and Management using System Calls

**Date:** 01-11-2026  
**Environment:** Ubuntu Linux (x86_64) / GCC

---

## Aim
To demonstrate process creation, identification, lifecycle execution, and parent-child process synchronization in Linux using POSIX system calls (`fork()`, `getpid()`, `sleep()`, `wait()`, `exit()`).

---

## Theoretical Background

1. **Process and PCB:**
   - A process is an instance of a computer program in execution.
   - The Linux kernel tracks processes through a Process Control Block (represented internally by `task_struct`), uniquely identified by a **Process Identifier (PID)**.

2. **The `fork()` System Call:**
   - `fork()` duplicates the calling process to create an exact child process.
   - It returns:
     - A negative value (`< 0`) if the fork failed.
     - `0` inside the newly created child process.
     - The child's PID (`> 0`) inside the parent process.

3. **Process Synchronization (`wait()`):**
   - When a child process terminates, its termination status must be reaped by the parent.
   - `wait(NULL)` blocks the calling parent process until one of its child processes finishes execution.
   - This prevents the child from becoming a **Zombie Process** (a dead process whose entry remains in the process table).

---

## Source Code (`exp10.c`)

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

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
        printf("Child PID: %d\n", getpid());
        printf("Child process is running\n");
        sleep(2);
        printf("Child process terminated\n");
        exit(0);
    }
    else
    {
        printf("Parent PID: %d\n", getpid());
        wait(NULL);
    }

    return 0;
}
```

---

## Compilation & Execution

```bash
# 1. Compile the C source code
gcc exp10.c -o exp10

# 2. Run the executable
./exp10
```

### Observed Execution Output
```text
Parent PID: 7428
Child PID: 7429
Child process is running
Child process terminated
```

---

## Key Takeaways
- The parent process was assigned PID `7428`, and the child was created with sequential PID `7429`.
- The child process executed independently, slept for 2 seconds, and called `exit(0)`.
- The parent successfully blocked on `wait(NULL)` until the child terminated, ensuring clean resource reclamation by the Linux kernel.
