import 'package:aula01/data/ContatoDao.dart';
import 'package:aula01/data/ContatoInherited.dart';
import 'package:aula01/components/contato.dart';
import 'package:aula01/screens/formulario.dart';
import 'package:flutter/material.dart';


class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos')),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 70),
        child: FutureBuilder(future: ContatoDao().findAll(),
            builder: (context, snapshot){
              List<Contato>? items = snapshot.data;
              switch (snapshot.connectionState){

                case ConnectionState.none:
                  // TODO: Handle this case.
                  return Center(child: Text('Nenhuma conexão iniciada.'));
                  //throw UnimplementedError();
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  //throw UnimplementedError();
                case ConnectionState.active:
                  return Center(child: Text('Carregando...'));
                  //throw UnimplementedError();
                case ConnectionState.done:
                  if(snapshot.hasData && items != null){
                    if(items.isNotEmpty){
                      return ListView.builder(itemCount: items.length,
                      itemBuilder: (BuildContext context, int index){
                        final Contato contato = items[index];
                        return contato;
                      },
                      );
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 120,),
                          Text('Não há nenhum contato', style: TextStyle(fontSize: 30),),
                        ],
                      ),
                    );
                  }
                  return Center(child: Text('Não há nenhum dado encontrado'));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNovo) => Formulario(contatoContext: context),
            ),
          ).then((onValue) => setState(() {
            print('Atualizando a tela');
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
