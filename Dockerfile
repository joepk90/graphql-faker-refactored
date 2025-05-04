# Stage 1: Build the Client
FROM node:20-slim AS client

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the frontend (graphql-faker-editor)
RUN git clone https://github.com/joepk90/graphql-faker-editor.git ./

# cant use package-lock.json  due to platform issues (@rollup/rollup-linux-arm64-gnu)
RUN rm package-lock.json 
RUN npm install
RUN npm run build

# Stage 2: Build Api
FROM node:20-slim AS api

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the backend (graphql-faker-server)
RUN git clone https://github.com/joepk90/graphql-faker-server.git ./

RUN npm install
RUN npm run build

# Stage 3: Build Proxy
FROM node:20-slim AS Proxy

# Install dependencies for proxy and monitoring (required for using concurrently npm package)
RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# copy client dist files, package.json and entryfile to client directory
COPY --from=client /app/dist ./client/dist
COPY --from=client /app/package.json ./client/package.json
# COPY --from=client /app/package-lock.json ./client/package-lock.json
COPY --from=client /app/entrypoint.js ./client/entrypoint.js
RUN cd client && npm install --production

# TODO make PROD installation work
# copy client dist files, package.json and entryfile to client directory
# COPY --from=api /app/dist ./api/dist
# COPY --from=api /app/package.json ./api/package.json
# COPY --from=api /app/tsconfig.json ./api/tsconfig.json
# COPY --from=api /app/package-lock.json ./client/package-lock.json
# RUN cd api && npm install --production
COPY --from=api /app ./api


COPY package.json ./package.json
COPY package-lock.json ./package-lock.json
COPY entrypoint.js ./entrypoint.js

RUN npm install


EXPOSE 8080
EXPOSE 5173
EXPOSE 3000

# Start Client, API and Proxy Server
CMD ["npm", "run", "start"]
