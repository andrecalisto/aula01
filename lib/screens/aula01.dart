
import 'package:flutter/material.dart';

class Aula01 extends StatefulWidget {
  const Aula01({super.key});

  @override
  State<Aula01> createState() => _Aula01State();
}

class _Aula01State extends State<Aula01> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(color: Colors.yellow, width: 100, height: 100),
            Container(color: Colors.green, width: 50, height: 50),
          ],
        ),
        Container(color: Colors.red, width: 100, height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(color: Colors.red, width: 100, height: 100),
            Container(
              color: Colors.white,
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/Steve_Jobs.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              color: Colors.white,
              width: 100,
              height: 100,
              child: Image.asset('assets/images/logo_flutter.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
          color: Colors.white,
          width: 300,
          height: 30,
          child: Text(
            'Olá Mundo',
            style: TextStyle(color: Colors.black, fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print('Você apertou o botão');
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Formulario(),),);
          },
          child: Text('Aperte o Botão!'),
        ),
      ],
    );
  }
}
