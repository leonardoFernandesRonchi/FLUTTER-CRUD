import 'package:flutter/material.dart';
import '../services/produto_service.dart';
import 'produto_detail_screen.dart';

class ProdutoListScreen extends StatefulWidget {
  @override
  _ProdutoListScreenState createState() => _ProdutoListScreenState();
}

class _ProdutoListScreenState extends State<ProdutoListScreen> {
  final ProdutoService service = ProdutoService();
  late Future<List<dynamic>> produtos;

  @override
  void initState() {
    super.initState();
    produtos = service.getProdutos();
  }

  void _reloadProdutos() {
    setState(() {
      produtos = service.getProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produtos")),
      body: RefreshIndicator(
        onRefresh: () async {
          _reloadProdutos();
        },
        child: FutureBuilder<List<dynamic>>(
          future: produtos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var produto = snapshot.data![index];
                  return ListTile(
                    title: Text(produto["nome"]),
                    subtitle: Text("R\$ ${produto["preco"]}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProdutoDetailScreen(id: produto["id"]),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Erro: ${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/novo');
          if (result == true) {
            _reloadProdutos(); // recarrega lista se houve novo produto
          }
        },
      ),
    );
  }
}
