FROM docker.n8n.io/n8nio/n8n:1.41.1
USER root
RUN npm install -g \
  node-fetch \
  date-fns \
  nodemailer \
  simple-timeout-promise \
  axios \
  qs \
  iconv-lite \
  form-data \
  axios-cookiejar-support \
  tough-cookie \
  node-table-to-csv \
  csvtojson \
  cheerio
USER node
