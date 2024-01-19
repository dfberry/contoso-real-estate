# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/playwright:v1.38.1-jammy

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install
COPY . .

CMD npx playwright test --reporter=html
