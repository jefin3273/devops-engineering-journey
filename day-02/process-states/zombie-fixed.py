import os
import time

pid = os.fork()

if pid == 0:
    print(f"Child process {os.getpid()} exiting...")
    os._exit(0)
else:
    print(f"Parent process: {os.getpid()}")
    print(f"Child process: {pid}")

    time.sleep(5)

    print("Parent is now waiting for the child...")
    os.waitpid(pid, 0)

    print("Child has been reaped.")
    time.sleep(120)
