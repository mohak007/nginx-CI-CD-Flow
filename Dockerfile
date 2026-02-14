FROM node:18-alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install


FROM nginx:alpine
COPY --from=builder /app/node_modules /tmp/node_modules
COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf


EXPOSE 80

RUN ["nginx", "-g", "daemon off;"]
