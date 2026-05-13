FROM node:22-alpine
WORKDIR /src
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm install
COPY . .
RUN npm run build
EXPOSE 5000
CMD ["node", "dist/index.js"]