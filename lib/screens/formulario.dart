import 'package:aula01/data/ContatoDao.dart';
import 'package:aula01/data/ContatoInherited.dart';
import 'package:aula01/components/contato.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  Formulario({super.key, required this.contatoContext});

  BuildContext contatoContext;

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  final _chaveForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _chaveForm,
      child: Scaffold(
        appBar: AppBar(title: const Text('Formulário')),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              height: 650,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o seu nome';
                        } else {
                          return null;
                        }
                      },
                      controller: nomeController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || int.parse(value) < 0) {
                          return 'Insira uma idade válida';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: idadeController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Idade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 11) {
                          return 'Insira um telefone válido';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      controller: telefoneController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Telefone',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_chaveForm.currentState!.validate()) {
                        //print(nomeController.text);
                        // print(idadeController.text);
                        // print(telefoneController.text);
                        ContatoDao().insertContato(
                          Contato(
                            nomeController.text,
                            idadeController.text,
                            telefoneController.text,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Adicionando o Contato'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
