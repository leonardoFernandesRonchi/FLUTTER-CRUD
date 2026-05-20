const { Produto } = require("../models");

const criarProduto = async (req, res) => {
  try {
    const { nome, preco } = req.body;

    if (!nome || !preco) {
      return res.status(400).json({
        erro: "Nome e preço são obrigatórios",
      });
    }

    const produto = await Produto.create({
      nome,
      preco,
    });

    res.status(201).json(produto);
  } catch (error) {
    console.log(error);

    res.status(500).json({
      erro: "Erro ao criar produto",
    });
  }
};

const listarProdutos = async (req, res) => {
  try {
    const produtos = await Produto.findAll();

    res.json(produtos);
  } catch (error) {
    console.log(error);

    res.status(500).json({
      erro: "Erro ao buscar produtos",
    });
  }
};

const buscarProduto = async (req, res) => {
  try {
    const { id } = req.params;

    const produto = await Produto.findByPk(id);

    if (!produto) {
      return res.status(404).json({
        erro: "Produto não encontrado",
      });
    }

    res.json(produto);
  } catch (error) {
    console.log(error);

    res.status(500).json({
      erro: "Erro ao buscar produto",
    });
  }
};

module.exports = {
  criarProduto,
  listarProdutos,
  buscarProduto,
};
