# Docker Tutorial — Student Lab Guide

Follow these steps in order. Each step builds on the previous one.

---

## Prerequisites

Before you start, make sure you have:

1. **Docker installed** — verify with:
   ```bash
   docker --version
   ```
2. **A Docker Hub account** — sign up at https://hub.docker.com/signup
3. **A terminal** (any command line: Terminal, PowerShell, Git Bash)

---

## Step 1: Clone or Download the Project

Get the project files onto your machine. The folder structure looks like this:

```
docker-tutorial/
├── Dockerfile
└── src/
    ├── index.html
    └── styles.css
```

- `Dockerfile` — Instructions for Docker to build your image
- `src/` — Your website source files (HTML, CSS)

---

## Step 2: Understand the Dockerfile

Open the `Dockerfile` and read through it:

```dockerfile
FROM nginx:alpine
COPY src/ /usr/share/nginx/html/
EXPOSE 80
```

| Line | What it does |
|------|-------------|
| `FROM nginx:alpine` | Uses a tiny web server image (~5MB) as the base |
| `COPY src/ /usr/share/nginx/html/` | Copies your `src/` folder into the server's web root |
| `EXPOSE 80` | Documents that the app runs on port 80 |

---

## Step 3: Build the Docker Image

Navigate into the project folder and build:

```bash
cd docker-tutorial
docker build -t docker-tutorial:v1 .
```

- `-t docker-tutorial:v1` — names your image `docker-tutorial` with version tag `v1`
- `.` — tells Docker to use the current directory (where the Dockerfile is)

Verify it was created:

```bash
docker images
```

You should see `docker-tutorial` with tag `v1` in the list.

---

## Step 4: Run a Container

Start a container from your image:

```bash
docker run -d -p 8080:80 --name my-site docker-tutorial:v1
```

| Flag | Meaning |
|------|---------|
| `-d` | Run in background (detached) |
| `-p 8080:80` | Map your port 8080 → container's port 80 |
| `--name my-site` | Give the container a friendly name |

**Test it:** Open http://localhost:8080 in your browser. You should see the Learn Docker page.

Verify it's running:

```bash
docker ps
```

---

## Step 5: Make a Change and Rebuild

1. Open `src/index.html` and make any visible change (edit a heading, change text, etc.)

2. Rebuild with a new version tag:
   ```bash
   docker build -t docker-tutorial:v2 .
   ```

3. Stop and remove the old container:
   ```bash
   docker rm -f my-site
   ```

4. Run the new version:
   ```bash
   docker run -d -p 8080:80 --name my-site docker-tutorial:v2
   ```

5. Refresh http://localhost:8080 — you should see your change.

---

## Step 6: Push to Docker Hub

1. Log in to Docker Hub:
   ```bash
   docker login
   ```

2. Tag your image with your Docker Hub username:
   ```bash
   docker tag docker-tutorial:v2 YOUR_USERNAME/docker-tutorial:v2
   ```

3. Push it:
   ```bash
   docker push YOUR_USERNAME/docker-tutorial:v2
   ```

4. Verify at: `https://hub.docker.com/r/YOUR_USERNAME/docker-tutorial`

---

## Step 7: Pull a Classmate's Image

Ask a classmate for their Docker Hub username, then:

```bash
docker pull CLASSMATE_USERNAME/docker-tutorial:v2
docker run -d -p 9090:80 --name classmate-site CLASSMATE_USERNAME/docker-tutorial:v2
```

Visit http://localhost:9090 to see their page running on your machine.

---

## Step 8: Clean Up

When you're done, remove containers and images:

```bash
# Stop and remove all your containers
docker rm -f my-site classmate-site

# Remove your images
docker rmi docker-tutorial:v1 docker-tutorial:v2

# Or remove all unused images at once
docker image prune -a -f
```

---

## Quick Reference

| Task | Command |
|------|---------|
| Build an image | `docker build -t name:tag .` |
| Run a container | `docker run -d -p HOST:CONTAINER --name NAME IMAGE` |
| List running containers | `docker ps` |
| List all containers | `docker ps -a` |
| Stop a container | `docker stop NAME` |
| Remove a container | `docker rm -f NAME` |
| List images | `docker images` |
| Remove an image | `docker rmi IMAGE` |
| Remove all unused images | `docker image prune -a -f` |
| Push to Docker Hub | `docker push USERNAME/IMAGE:TAG` |
| Pull from Docker Hub | `docker pull USERNAME/IMAGE:TAG` |

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "port is already allocated" | Change the host port: `-p 9090:80` instead of `8080` |
| "image not found" | Check spelling, or rebuild with `docker build` |
| "permission denied" | Use `sudo` or add your user to the docker group |
| Browser shows default nginx page | Make sure you're copying `src/` not individual files |
| Can't remove an image | Remove containers using it first: `docker rm -f NAME` |
