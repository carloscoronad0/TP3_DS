FROM node

EXPOSE 1883
WORKDIR /usr/src/app
COPY app .
RUN npm install
CMD ["node", "app.js"]