import 'package:flutter/material.dart';
import 'screens/produto_list_screen.dart';
import 'screens/produto_detail_screen.dart';
import 'screens/produto_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produtos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProdutoListScreen(),
        '/detalhe': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as int;
          return ProdutoDetailScreen(id: args);
        },
        '/novo': (context) => ProdutoFormScreen(),
      },
    );
  }
}
