# Satisfactory Server Containerfile

## Ports
- Port exposed is 7777 tcp/udp, and 8888 tcp

## Command
- You have to ensure the ports are not randomly assigned (map each port to host machine's respective port)
EX:
```
podman run -p 7777:7777/tcp -p 7777:7777/udp -p 8888:8888 [image]
```
