import 'dart:convert';
import 'package:http/http.dart' as http;

class ProdutoService {
  final String baseUrl = "http://localhost:3000/produtos";

  Future<List<dynamic>> getProdutos() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao carregar produtos");
    }
  }

  Future<Map<String, dynamic>> getProduto(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao carregar produto");
    }
  }

  Future<Map<String, dynamic>> criarProduto(String nome, double preco) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"nome": nome, "preco": preco}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao criar produto");
    }
  }
}
