FROM node:12

WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY ./share_book_front/package*.json ./
#COPY ./share_book/.env ./

RUN npm install

COPY ./share_book_front .

#RUN yarn build

CMD ["npm", "run", "dev"]