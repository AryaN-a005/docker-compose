# docker-compose

A small Node.js API that uses Express, Mongoose, and MongoDB.

This repository includes two layers of documentation:

- [contributors.md](contributors.md) for installation and run instructions
- this README for a quick overview, common commands, and project notes

## What the app does

The app exposes a simple `/users` API with two routes:

- `POST /users` to create a user
- `GET /users` to list users

It connects to MongoDB from the Node.js server and runs either locally or through Docker Compose.

## Tech Stack

- Node.js 22+
- TypeScript
- Express
- Mongoose
- MongoDB
- Docker and Docker Compose

## Project Structure

- `src/index.ts` - API server and MongoDB connection logic
- `Dockerfile` - container build for the Node.js app
- `Docker-compose.yml` - local multi-container setup for the app and MongoDB
- `contributors.md` - installation and setup guide

## Quick Start

If you already have Docker installed, the fastest way to run the project is:

```bash
docker-compose up --build
```

The compose file starts:

- MongoDB on port `27017`
- the app on host port `5001`

Open the app at:

```bash
http://localhost:5001
```

## Local Development

If you want to run the app without Docker, use the manual steps in [contributors.md](contributors.md).

The short version is:

```bash
npm install
npm run build
node dist/index.js
```

You also need MongoDB running locally at:

```bash
mongodb://localhost:27017/
```

## Common Commands

```bash
npm run build
docker-compose up --build
docker compose up --build
```

## Troubleshooting

- If `docker-compose up` fails because port `5000` is busy, use the mapped host port `5001`.
- If the app starts but MongoDB does not connect, confirm the app is using the Docker service name `mongo` inside Compose.
- If you are running manually, change the MongoDB URL to `mongodb://localhost:27017/`.

## Notes

- The current container listens on port `5000` internally.
- Docker Compose publishes that container port to host port `5001`.
- The repository currently focuses on a simple API and local development workflow.