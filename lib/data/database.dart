import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> getDataBase() async {
  print('Conectando ao banco de dados');

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Ambiente desktop
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;

    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, 'contato_database.db');

    return databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE contatos(nome TEXT, idade TEXT, telefone TEXT PRIMARY KEY)',
          );
        },
      ),
    );
  } else {
    // Ambiente mobile (Android/iOS)
    final path = join(await getDatabasesPath(), 'contato_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE contatos(nome TEXT, idade TEXT, telefone TEXT PRIMARY KEY)',
        );
      },
    );
  }
}