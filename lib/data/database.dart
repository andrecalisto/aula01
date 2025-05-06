import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  print('Conectando ao banco de dados');
  WidgetsFlutterBinding.ensureInitialized();
  Future<Database> database;
  return database = openDatabase(
    join(await getDatabasesPath(), 'contato_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE contatos(nome TEXT, idade TEXT, telefone TEXT PRIMARY KEY)',
      );
    },
    version: 1,
  );
}