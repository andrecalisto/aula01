import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  final String nome;
  final String telefone;
  final String idade;
  const Contato(this.nome, this.idade, this.telefone, {super.key});

  Map<String, Object?> toMap() {
    return {'nome': nome, 'idade': idade, 'telefone': telefone};
  }

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 110),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),

            height: 100,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.lightBlueAccent,
                  ),

                  width: 72,
                  height: 100,
                  child: Image.asset(
                    'assets/images/logo_flutter.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome: ' + widget.nome,
                      style: TextStyle(fontSize: 16, color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      'Idade: ' + widget.idade,
                      style: TextStyle(fontSize: 16, color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      'Telefone: ' + '('+ widget.telefone.substring(0,2)+') '+widget.telefone.substring(2,7)+'-'+widget.telefone.substring(7,11),
                      style: TextStyle(fontSize: 16, color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 52,
            width: 52,
          )
        ],
      ),
    );
  }
}

