# Docker Tutorial — UCC

A hands-on Docker tutorial for students. Learn how to build, run, edit, push, and pull Docker images using a simple static website served with nginx.

## Project Structure

```
docker-tutorial/
├── Dockerfile
├── src/
│   ├── index.html
│   └── styles.css
├── DOCKER_GUIDE.md
├── STUDENT_LAB.md
├── PUSH_TO_DOCKERHUB.md
└── README.md
```

## Quick Start

```bash
# Build the image
docker build -t docker-tutorial:v1 .

# Run the container
docker run -d -p 8080:80 --name my-site docker-tutorial:v1

# Open in browser
# http://localhost:8080
```

## Guides Included

| File | Description |
|------|-------------|
| `DOCKER_GUIDE.md` | Comprehensive Docker reference covering all concepts |
| `STUDENT_LAB.md` | Step-by-step lab guide for students to follow along |
| `PUSH_TO_DOCKERHUB.md` | Focused guide on pushing images to Docker Hub |

## Key Commands

| Task | Command |
|------|---------|
| Build | `docker build -t docker-tutorial:v1 .` |
| Run | `docker run -d -p 8080:80 --name my-site docker-tutorial:v1` |
| Stop & remove | `docker rm -f my-site` |
| Push to Hub | `docker push USERNAME/docker-tutorial:v1` |
| Shell into container | `docker exec -it my-site sh` |

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Hub](https://hub.docker.com/signup) account (for pushing)

## Useful Links

- [Docker Official Images](https://hub.docker.com/search?badges=official) — Curated, trusted base images
- [Docker Installation Guide](https://docs.docker.com/engine/install) — Install Docker on any OS
- [Excalidraw](https://excalidraw.com/) — Whiteboard tool for architecture diagrams
