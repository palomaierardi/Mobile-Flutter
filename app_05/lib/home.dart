import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
 
  String infoResultado = "Classificação!";
 
  void _calculoIMC() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
 
      double resultado = n1 / (n2 * n2)  ;
 if(resultado < 18.5){
    infoResultado = 'Abaixo do Peso';
 }
else if (resultado >= 18.5 && resultado <= 24.9 ){
  infoResultado = 'Peso Normal';
}
else if (resultado >= 25 && resultado <= 29.9 ){
  infoResultado = 'Sobrepeso';
}
else if (resultado >= 30 && resultado < 34.9 ){
  infoResultado = 'Obesidade Grau I';
}
else if (resultado >= 35 && resultado < 39.9 ){
  infoResultado = 'Obesidade Grau II';
}
else {
  infoResultado = 'Obesidade Grau III';
}
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Cálculo IMC"),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
    );
  }

   _foto() {
    return Center(
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6U7Hu5lsDC_AP6G626PiKC2TZk70OmNpltw&usqp=CAU',
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
          _campo("Peso", n1Controller),
          _campo("Altura", n2Controller),
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
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.lightBlueAccent)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
      controller: objController,
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calculoIMC,
          child: Text("Verificar",
              style: TextStyle(color: Colors.black38, fontSize: 20.0)),
          color: Colors.blue
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blueGrey, fontSize: 30.0),
    );
  }
}
