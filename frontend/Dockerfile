# Install dependencies
FROM node:14-alpine AS builder

WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm ci

COPY . .

# Production stage
FROM node:14-alpine

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app /usr/src/app
RUN npm prune --production
EXPOSE 3000
CMD ["npm", "start"]