import 'package:aula01/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/contato.dart';

class ContatoDao{
  Future<List<Contato>> findAll() async {
    print('Buscando os contatos no banco de dados');
    final db = await getDataBase();

    // Query the table for all the dogs.
    final List<Map<String, Object?>> contatoMaps = await db.query('contatos');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {'nome': nome as String, 'idade': idade as String, 'telefone': telefone as String}
      in contatoMaps)
        Contato(nome, idade, telefone),
    ];
  }

  Future<void> insertContato(Contato contato) async {
    print('Inserindo contato ao banco de dados');
    final db = await getDataBase();
    await db.insert(
      'contatos',
      contato.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}