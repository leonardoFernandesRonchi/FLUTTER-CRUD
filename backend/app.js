const express = require("express");
const cors = require("cors");

const produtoRoutes = require("./routes/produtoRoutes");

const app = express();

app.use(cors());
app.use(express.json());

app.use(produtoRoutes);

module.exports = app;
