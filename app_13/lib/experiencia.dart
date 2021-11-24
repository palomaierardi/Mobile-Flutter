import 'package:flutter/material.dart';
 
class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Experiência', textAlign: TextAlign.center),
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          _texto('Analista Jira'), 
          _texto('Empresa: Yellow Networking'),
          _texto('De: 01/2021'),
          _texto('Até: 06/2021'),
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