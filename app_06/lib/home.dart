import 'package:flutter/material.dart';
import 'dart:math';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
 
  String infoResultado = "";
 
  void _calculoaleatorio() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      int numero = new Random().nextInt(10);

    if (n1 == numero) {
      infoResultado = 'Você acertou';
    }
    else {
      infoResultado = 'Vish... Não foi dessa vez! O número certo era $numero';
    }
     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.purpleAccent,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Jogo do Nº Aleatório"),
      centerTitle: true,
      backgroundColor: Colors.deepPurpleAccent,
    );
  }

   _foto() {
    return Center(
      child: Image.network(
        'https://media.istockphoto.com/photos/colorful-random-number-background-illustration-picture-id499812369',
        height: 250,
        width: 250,
      ),
    );
  }

 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _texto('Pense em um número de 0 a 10'),
          _campo("Digite o número", n1Controller),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }
 
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.white)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 30.0),
      controller: objController,
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calculoaleatorio,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.deepPurpleAccent
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 30.0),
    );
  }
}