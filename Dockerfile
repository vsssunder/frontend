FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "start"]

EXPOSE 80
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html