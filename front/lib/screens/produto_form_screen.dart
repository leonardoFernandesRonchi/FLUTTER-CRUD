import 'package:flutter/material.dart';
import '../services/produto_service.dart';

class ProdutoFormScreen extends StatefulWidget {
  @override
  _ProdutoFormScreenState createState() => _ProdutoFormScreenState();
}

class _ProdutoFormScreenState extends State<ProdutoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final ProdutoService service = ProdutoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Produto")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome"),
                validator: (value) =>
                    value!.isEmpty ? "Informe o nome" : null,
              ),
              TextFormField(
                controller: _precoController,
                decoration: InputDecoration(labelText: "Preço"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Informe o preço" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Salvar"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await service.criarProduto(
                      _nomeController.text,
                      double.parse(_precoController.text),
                    );
                    _nomeController.clear();
                    _precoController.clear();
                    Navigator.pop(context, true); // devolve "true" para indicar atualização
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
