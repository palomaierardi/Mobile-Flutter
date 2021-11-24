import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController valorController = TextEditingController();
  String info_conversor = '';
  String dropdownDe = '';
  String dropdownPara = '';

  _converterMoeda() async {
    if(dropdownDe == 'Real' && dropdownPara == 'Dolar' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/BRL-USD';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["BRLUSD"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Dolar' && dropdownPara == 'Real' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["USDBRL"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Real' && dropdownPara == 'Euro' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/BRL-EUR';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["BRLEUR"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Euro' && dropdownPara == 'Real' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/EUR-BRL';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["EURBRL"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Euro' && dropdownPara == 'Dolar' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/EUR-USD';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["EURUSD"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Dolar' && dropdownPara == 'Euro' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/USD-EUR';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["USDEUR"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Real' && dropdownPara == 'Bitcoin' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/BRL-BTC';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["BRLBTC"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Bitcoin' && dropdownPara == 'Real' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/BTC-BRL';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["BTCBRL"]["ask"];
    double conversao = valorDigitado / double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Dolar' && dropdownPara == 'Bitcoin' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/USD-BTC';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["USDBTC"]["ask"];
    double conversao = valorDigitado / double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Bitcoin' && dropdownPara == 'Dolar' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/BTC-USD';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["BTCUSD"]["ask"];
    double conversao = valorDigitado / double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Euro' && dropdownPara == 'Bitcoin' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/EUR-BTC';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["EURBTC"]["ask"];
    double conversao = valorDigitado * double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  if(dropdownDe == 'Bitcoin' && dropdownPara == 'Euro' ){
    String url = 'https://economia.awesomeapi.com.br/json/last/BTC-EUR';
    
    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    double valorDigitado = double.parse(valorController.text);
    String convertido = retorno["BTCEUR"]["ask"];
    double conversao = valorDigitado / double.parse(convertido);


    setState(() {
      info_conversor =
          'Valor Convertido: $conversao';
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _converterMoeda,
                  child: Text("Converter",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            Text(info_conversor),
          ],
        ),
      ),
    );
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

 _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 30.0),
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
      items: <String>['','Real', 'Dolar', 'Euro', 'Bitcoin']
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
      items: <String>['','Real', 'Dolar', 'Euro', 'Bitcoin']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

}
