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

