FROM node:8
COPY . /src
EXPOSE 9090
CMD ["npm", "start"]

