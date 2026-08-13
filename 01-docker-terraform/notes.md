### For shortening the command prompt

```zsh
setopt PROMPT_SUBST
PS1='%F{cyan}[${${PWD:t}:0:3}]%f:%F{green}$(git branch --show-current 2>/dev/null)%f > '
```

### Run ubuntu container

```
docker run ubuntu
```

Open with terminal
```
docker run -it ubuntu
```


docker run -it **python**:**3.13.11** \
(image):(tag)

```
docker run -it --entrypoint=bash
```
opens bash instead python

```
docker ps -a        # list containers
docker ps -aq        # list only container IDs
```

```
-v $(pwd):/workspace      
```
Mounts the current working directory (volume) to the /workspace directory inside the container. NB! This is a live reference. Changing files in one location updates the other.

### Dockerfile


```dockerfile
FROM python:3.13.11-slim
COPY ["pipeline/pipeline.py", "/app/"]
CMD ["python", "/app/pipeline.py"]    

ENTRYPOINT #specifies default command. If you provide your own, it replaces ENTRYPOINT command. But it does not replace the end part of it (in this case pipeline.py).
```

### Example runs
```
docker build -t test:pandas .
```

-t specifies name:tag of the image.

Combining ENTRYPOINT and CMD (Best Practice Pattern)
You can use ENTRYPOINT for the executable and CMD for default arguments:
```dockerfile
FROM python:3.13.11-slim
WORKDIR /code
COPY ["pipeline.py", "."]

ENTRYPOINT ["python", "pipeline.py"]
CMD ["--day", "1"]
```

Then you can run it like this:
```
docker run --rm test:pandas      # Runs pipeline.py with default --day 1
docker run --rm test:pandas --day 2    # Runs pipeline.py with --day 2
```

Copy from another image
```
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin
```