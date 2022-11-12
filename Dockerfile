FROM node:latest as Build
WORKDIR /app
COPY package.json .
RUN npm install

FROM node:latest as Service
WORKDIR /app
COPY --from=Build /app/node_modules /app/node_modules
COPY . .
RUN ls -al
CMD ["npm", "run", "start"]
