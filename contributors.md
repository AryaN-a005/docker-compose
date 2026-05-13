# Contributors Setup Guide

This project is a small Node.js API that connects to MongoDB. You can run it in three ways: with Docker, with Docker Compose, or manually on your machine.

## Prerequisites

- Node.js 22 or newer
- npm
- Docker Desktop
- Docker Compose

## 1. Docker Installation

Install Docker Desktop from the official Docker website.

On Windows:
- Download Docker Desktop.
- Install it with the default options.
- Make sure WSL 2 is enabled if Docker Desktop asks for it.
- Start Docker Desktop and wait until it shows that the engine is running.

Verify the installation:

```bash
docker --version
docker compose version
```

## 2. Docker Compose Installation

Recent Docker Desktop versions include Docker Compose automatically.

If you already have Docker Desktop:
- Docker Compose should already be available.
- Verify it with:

```bash
docker compose version
```

If you are using an older setup, install the standalone Docker Compose plugin or binary from the Docker documentation for your platform.

## 3. Run With Docker Compose

From the project root:

```bash
docker-compose up --build
```

Or, with newer Docker Compose syntax:

```bash
docker compose up --build
```

This starts:
- `mongo` on port `27017`
- the app on host port `5001`

Open the app at:

```bash
http://localhost:5001
```

## 4. Manual Installation

If you want to run the app without Docker, install the dependencies locally.

### Install dependencies

```bash
npm install
```

### Build the TypeScript app

```bash
npm run build
```

### Start MongoDB locally

Make sure MongoDB is running on your machine at:

```bash
mongodb://localhost:27017/
```

### Run the app

The current project only defines a build script, so start it with Node after building:

```bash
node dist/index.js
```

If you want a local dev loop, you can add a watch or start script later.

## Notes

- The app currently listens on port `5000` inside the container.
- Docker Compose maps that to host port `5001` to avoid conflicts.
- If port `5001` is already in use, change the host port in `Docker-compose.yml`.
- If MongoDB connection issues appear, confirm the app is using the Docker service name `mongo` inside Compose, or `localhost` when running manually.