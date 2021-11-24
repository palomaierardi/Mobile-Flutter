import 'package:flutter/material.dart';
 
class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formação', textAlign: TextAlign.center),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          _texto('Analise e Desenvolvimento de Sistemas'), 
          _texto('Fatec PG'),
          _texto('Início: 01/2020'),
          _texto('Término: 12/2022'),
        ]
      )
    );
  }
 
  
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
}