import os
import time

pid=os.fork()

if pid==0:
    print(f"Child process {os.getpid()} exiting...")
    os._exit(0)
else:
    print(f"Parent process: {os.getpid()}")
    print(f"Child process: {pid}")
    print("Parent will NOT wait for the child.")
    print("Sleeping for 120 seconds...")
    time.sleep(120) 
