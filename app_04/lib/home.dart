import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
 
  String infoResultado = "Resultado!";
 
  void _calculoVerificar() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
 
      double resultado = n1 / n2  ;
 if(resultado <= 0.7){
    infoResultado = 'A melhor escolha é: Álcool';
 }
else {
  infoResultado = 'A melhor escolha é: Gasolina';
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
      title: Text("Álcool ou Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

   _foto() {
    return Center(
      child: Image.network(
        'https://opetroleo.com.br/wp-content/uploads/2018/09/Calculadora-Flex.jpg',
        height: 150,
        width: 150,
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
          _campo("Digite o preço do Álcool", n1Controller),
          _campo("Digite o preço da Gasolina", n2Controller),
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
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.grey)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
      controller: objController,
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calculoVerificar,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
    );
  }
}
