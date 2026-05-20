const express = require("express");

const router = express.Router();

const {
  criarProduto,
  listarProdutos,
  buscarProduto,
} = require("../controllers/produtoController");

router.post("/produtos", criarProduto);

router.get("/produtos", listarProdutos);

router.get("/produtos/:id", buscarProduto);

module.exports = router;
