FROM node:24 AS builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
# npm run build
# npm run test

FROM node:24-slim
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY --from=builder /app .
EXPOSE 3000
CMD ["node", "app.js"]