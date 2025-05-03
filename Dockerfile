# Stage 1: Build the Frontend
FROM node:20-slim AS frontend-builder

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the frontend (graphql-faker-editor)
RUN git clone https://github.com/joepk90/graphql-faker-editor.git ./

# cant use package-lock.json  due to platform issues (@rollup/rollup-linux-arm64-gnu)
RUN rm package-lock.json 
RUN npm install
RUN npm run build

# Stage 2: Build Backend
FROM node:20-slim AS server

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the backend (graphql-faker-server)
RUN git clone https://github.com/joepk90/graphql-faker-server.git ./api

RUN cd api && npm install
RUN cd api &&  npm run build

# copy client dist files to current build
COPY --from=frontend-builder /app/dist ./client
COPY --from=frontend-builder /app/entrypoint.js ./entrypoint.js
RUN npm install -g concurrently
RUN npm install serve-handler

EXPOSE 8080
EXPOSE 9092

# Start both servers
# CMD ["concurrently", "-k", "-n", "BACKEND,FRONTEND", "-c", "blue,green", \
#       "npm run serve:prod", "node entrypoint.js client"]

CMD ["concurrently", "-k", "-n", "BACKEND,FRONTEND", "-c", "blue,green", \
     "cd api && npm run serve:prod", "node entrypoint.js client"]