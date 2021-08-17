import time

print("Starting ...")

while True:
    print("Still alive!")
    with open("/tmp/health.txt",'w') as health:
        health.write("OK")
    time.sleep(5)
