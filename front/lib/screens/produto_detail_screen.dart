import 'package:flutter/material.dart';
import '../services/produto_service.dart';

class ProdutoDetailScreen extends StatelessWidget {
  final int id;
  final ProdutoService service = ProdutoService();

  ProdutoDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Produto")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: service.getProduto(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var produto = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produto["nome"], style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text("Preço: R\$ ${produto["preco"]}"),
                  SizedBox(height: 10),
                  Text("Criado em: ${produto["createdAt"]}"),
                  Text("Atualizado em: ${produto["updatedAt"]}"),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
