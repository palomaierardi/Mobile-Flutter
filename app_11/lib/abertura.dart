import 'package:flutter/material.dart'; 
 
class Conta extends StatelessWidget {
  String valueNome;
  String valueIdade;
  String valueSexo;
  String valueEscola;
  String valueLimite;
  String valueBrasileiro;
  Conta({required this.valueNome, required this.valueIdade, required this.valueSexo, required this.valueEscola, required this.valueLimite, required this.valueBrasileiro});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Informados'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _texto(valueNome),
          _texto(valueIdade),
          _texto(valueSexo),
          _texto(valueEscola),
          _texto(valueLimite),
          _texto(valueBrasileiro),
          _texto(''),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: () => _onClickVoltar(context),
          ),
        ],
      ),
    );
  }
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context);
  }
}