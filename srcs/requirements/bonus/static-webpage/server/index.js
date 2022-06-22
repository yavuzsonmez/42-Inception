const path = require("path");
const express = require("express");
const app = express(); // create express app

// express middlewares for static files
app.use(express.static(path.join(__dirname, '/..')));

// start express server on port 5000
app.listen(5000, () => {
  console.log("express server started on port 5000");
});