import 'package:aula01/components/contato.dart';
import 'package:flutter/material.dart';

class ContatoInherited extends InheritedWidget {
   ContatoInherited({super.key, required Widget child}) : super(child: child);

  final List<Contato> contatoList = [
    Contato('André Calisto', '38', '66984012612'),
    Contato('Maria', '20', '66984012612'),
    Contato('João', '65', '66984012612'),
  ];

  void novoContato(String nome, String idade, String telefone){
    contatoList.add(Contato(nome, idade, telefone));
  }

  static ContatoInherited of(BuildContext context) {
    final ContatoInherited? result = context.dependOnInheritedWidgetOfExactType<ContatoInherited>();
    assert(result != null, 'No a found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ContatoInherited old) {
    return old.contatoList.length != contatoList.length;
  }
}
