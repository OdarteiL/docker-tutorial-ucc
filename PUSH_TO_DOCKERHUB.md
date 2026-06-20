# Pushing Docker Images to Docker Hub — Student Guide

A focused guide on tagging and pushing your Docker images to Docker Hub.

---

## Prerequisites

1. A **Docker Hub account** — https://hub.docker.com/signup
2. A **built Docker image** on your machine (run `docker images` to confirm)

---

## Step 1: Log In to Docker Hub

```bash
docker login
```

Enter your Docker Hub **username** and **password** when prompted.

You only need to do this once per machine — Docker saves your credentials.

---

## Step 2: Tag Your Image

Docker Hub requires images in the format: `username/image-name:tag`

```bash
docker tag docker-tutorial:v1 YOUR_USERNAME/docker-tutorial:v1
```

**Example:** If your username is `johndoe`:
```bash
docker tag docker-tutorial:v1 johndoe/docker-tutorial:v1
```

This doesn't create a copy — it just adds a new name pointing to the same image.

---

## Step 3: Push the Image

```bash
docker push YOUR_USERNAME/docker-tutorial:v1
```

You'll see Docker uploading layers one by one. Layers already on Docker Hub are skipped automatically.

---

## Step 4: Verify on Docker Hub

Go to: `https://hub.docker.com/r/YOUR_USERNAME/docker-tutorial`

You should see your image with the tag `v1`.

---

## Pushing Multiple Versions

If you've rebuilt your image (e.g., `v2`), tag and push each version:

```bash
docker tag docker-tutorial:v2 YOUR_USERNAME/docker-tutorial:v2
docker push YOUR_USERNAME/docker-tutorial:v2
```

To also mark it as the latest:

```bash
docker tag docker-tutorial:v2 YOUR_USERNAME/docker-tutorial:latest
docker push YOUR_USERNAME/docker-tutorial:latest
```

---

## Pulling Your Image (On Another Machine)

Anyone can now pull and run your image:

```bash
docker pull YOUR_USERNAME/docker-tutorial:v1
docker run -d -p 8080:80 YOUR_USERNAME/docker-tutorial:v1
```

---

## Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| `denied: requested access to the resource is denied` | Not logged in or wrong username in tag | Run `docker login` and check your tag matches your username |
| `An image does not exist locally` | Typo in image name | Run `docker images` to see exact names |
| `unauthorized: authentication required` | Session expired | Run `docker login` again |

---

## Full Example (Copy-Paste Ready)

Replace `johndoe` with your actual Docker Hub username:

```bash
# Log in
docker login

# Build (if not already built)
docker build -t docker-tutorial:v1 .

# Tag
docker tag docker-tutorial:v1 johndoe/docker-tutorial:v1

# Push
docker push johndoe/docker-tutorial:v1

# Verify
echo "Check: https://hub.docker.com/r/johndoe/docker-tutorial"
```
