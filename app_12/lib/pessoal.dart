import 'package:flutter/material.dart';
 
class Pessoal extends StatelessWidget {
  const Pessoal({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal', textAlign: TextAlign.center),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          _texto('Paloma Ierardi Avelino'), 
          _texto('07/07/1995'),
          _texto('Brasileira'),
          _texto('13 991345-6542'),
          _texto('Santos-SP')
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