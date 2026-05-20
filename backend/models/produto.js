"use strict";

const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
  class Produto extends Model {}

  Produto.init(
    {
      nome: DataTypes.STRING,
      preco: DataTypes.DECIMAL,
    },
    {
      sequelize,
      modelName: "Produto",
    },
  );

  return Produto;
};
