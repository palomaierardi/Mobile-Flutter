
import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController valorController = TextEditingController();
 
  String dropdownDe = '';
  String dropdownPara = '';
  double valor1 = 0;
  String conversao = '';

  void _conversor() {
    setState(() {
      double valor = double.parse(valorController.text);
 
      
 if(dropdownDe == 'Real' && dropdownPara == 'Dolar' ){
    valor1 = valor / 5.45;
    conversao = valor1.toStringAsFixed(2);
 }
else if (dropdownDe == 'Dolar' && dropdownPara == 'Real' ){
    valor1 = valor * 5.45;
    conversao = valor1.toStringAsFixed(2);
}
else if (dropdownDe == 'Real' && dropdownPara == 'Euro' ){
    valor1 = valor / 6.48;
    conversao = valor1.toStringAsFixed(2);
}
else if (dropdownDe == 'Euro' && dropdownPara == 'Real' ){
    valor1 = valor * 6.48;
    conversao = valor1.toStringAsFixed(2);
}
else if (dropdownDe == 'Dolar' && dropdownPara == 'Euro' ){
    valor1 = valor / 1.14 ;
    conversao = valor1.toStringAsFixed(2);
}
else if (dropdownDe == 'Euro' && dropdownPara == 'Dolar' ){
    valor1 = valor * 1.14;
    conversao = valor1.toStringAsFixed(2);
}
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.orange,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Conversor de Moedas"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }


   _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           Container(
            height: 400,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 40, bottom: 40),
            color: Colors.white,
            child: Column(
              children: <Widget>[
          _campo("Valor: ", valorController),
          Row(
            children: [
            _texto('De: '),
            _texto('  '),
            _dropdownDe(),
            ],
          ),
          Row(
            children: [
            _texto('Para: '),
            _texto('  '),
            _dropdownPara(),
            ]
          ),
            
          _botao(),
          _texto('Resultado'),
          _texto(conversao)
        ],
      ),
    )
        ]
      ));
  }
 
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 30.0),
      controller: objController,
    );
  }
 
  _dropdownDe() {
    return DropdownButton<String>(
      value: dropdownDe,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black,fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownDe = newValue!;
        });
      },
      items: <String>['','Real', 'Dolar', 'Euro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _dropdownPara() {
    return DropdownButton<String>(
      value: dropdownPara,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black,fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownPara = newValue!;
        });
      },
      items: <String>['','Real', 'Dolar', 'Euro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _conversor,
          child: Text("Converter",
              style: TextStyle(color: Colors.orange, fontSize: 20.0)),
          color: Colors.black
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 30.0),
    );
  }
}