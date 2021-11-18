import 'package:flutter/material.dart';
import 'package:app_11/abertura.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  
  String dropdownValorSexo = 'Escolha seu sexo';
  String dropdownValorEscolaridade = ''; 
  double valorSlider = 0;
  bool valorSwitch = false;
  String infoResultado = '';
  String dadoNome = '';
  String dadoIdade = '';
  String dadoSexo = '';
  String dadoEscola = ' ';
  String dadoLimite = '';
  String dadoBr = ' ';
  
   void _dados() {
    setState(() {
      String nome = nomeController.text;
      double idade = double.parse(idadeController.text);

      infoResultado = "Dados Informados"; 
      dadoNome = 'Nome: ' + nome;
      dadoIdade = 'Idade: $idade';
      dadoSexo = 'Sexo: ' + dropdownValorSexo;
      dadoEscola = 'Escola: ' + dropdownValorEscolaridade;
      dadoLimite = 'Limite: $valorSlider';
      if(valorSwitch == true){
         dadoBr = 'Brasileiro: Sim' ;
      }else{
          dadoBr = 'Brasileiro: Não';
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
      title: Text("Abertura de conta"),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
    );
  }

 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo("Nome: ", nomeController),
          _campo("Idade: ", idadeController),
          Row(
            children: [
              _textoesq("Sexo: "),
              _dropdownSexo()
            ],
          ),
         Row(
           children: [
             _textoesq('Escolaridade: '), 
             _dropdownEscolaridade()
           ],
         ),
         Row(
           children: [
             _textoesq('Limite: '),
             _slider()
           ],
         ),
          Row(
           children: [
             _textoesq('Brasileiro: '),
             _switch()
           ],
         ),
          _botao(),
        ],
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
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: (){
             _dados();
          _onClickNavegacao(context);
        },
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.deepOrange
        ),
      ),
    );
  }
 
   _dropdownSexo() {
    return DropdownButton<String>(
      value: dropdownValorSexo,
      items: <String>['Escolha seu sexo' , 'Feminino', 'Masculino']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValorSexo = valorSelecionado!;
        });
      },
    );
  }

  _onClickNavegacao(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Conta(valueNome: dadoNome, valueIdade: dadoIdade, valueSexo: dadoSexo, valueEscola: dadoEscola, valueLimite: dadoLimite, valueBrasileiro: dadoBr);
        },
      ),
    );
  }



 _dropdownEscolaridade() {
    return DropdownButton<String>(
      value: dropdownValorEscolaridade,
      items: <String>['', 'Ensino Fundamental Completo', 'Ensino Médio Completo', 'Ensino Superior Completo']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValorEscolaridade = valorSelecionado!;
        });
      },
    );
  }

 _slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 5000,
      divisions: 100,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }

    _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }


  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 30.0),
    );
  }

   _textoesq(textoParaExibir) {
    return Text(
      textoParaExibir,
      style: TextStyle(color: Colors.black, fontSize: 30.0),
    );
  }
}
