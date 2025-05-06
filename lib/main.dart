import 'package:aula01/data/ContatoInherited.dart';
import 'package:aula01/screens/aula01.dart';
import 'package:aula01/components/contato.dart';
import 'package:aula01/screens/telaPrincipal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // 👈 força a cor do AppBar
          foregroundColor: Colors.white,
        ),
      ),
      home: ContatoInherited(child: TelaPrincipal()),
    );
  }
}
