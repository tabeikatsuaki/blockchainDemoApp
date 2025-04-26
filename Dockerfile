FROM node:23-bookworm

WORKDIR /app

COPY contacts ./contacts
COPY ignition ./ignition
COPY test ./test
COPY hardhat.config.ts ./
COPY package.json package-lock.json ./
COPY tsconfig.json ./

RUN npm install

# CMD ["npm", "run", "test"]