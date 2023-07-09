FROM klakegg/hugo:ext-alpine

COPY . /app/docsy/quasarplane/
WORKDIR /app/docsy/quasarplane/
RUN npm install --production=false
RUN git config --global --add safe.directory /app/docsy

CMD ["serve", "--cleanDestinationDir", "--themesDir", "../..", "--baseURL",  "http://localhost:1313/", "--buildDrafts", "--buildFuture", "--disableFastRender", "--ignoreCache", "--watch"]