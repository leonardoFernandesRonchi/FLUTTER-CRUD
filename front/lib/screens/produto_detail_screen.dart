import 'package:flutter/material.dart';
import '../services/produto_service.dart';

class ProdutoDetailScreen extends StatelessWidget {
  final int id;
  final ProdutoService service = ProdutoService();

  ProdutoDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Detalhes do Produto"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: service.getProduto(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var produto = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.inventory_2,
                          size: 80,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        produto["nome"],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Divider(height: 30),

                      ListTile(
                        leading: const Icon(
                          Icons.attach_money,
                          color: Colors.green,
                        ),
                        title: const Text("Preço"),
                        subtitle: Text(
                          "R\$ ${produto["preco"]}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: const Text("Criado em"),
                        subtitle: Text(produto["createdAt"]),
                      ),

                      ListTile(
                        leading: const Icon(Icons.update),
                        title: const Text("Atualizado em"),
                        subtitle: Text(produto["updatedAt"]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erro: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
