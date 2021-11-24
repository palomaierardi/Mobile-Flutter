import 'package:flutter/material.dart';
import 'package:app_13/pessoal.dart';
import 'package:app_13/formacao.dart';
import 'package:app_13/experiencia.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentIndex = 0;
 
  final tabs = [
    Center(child: Text('Tela Home')),
    Pessoal(),
    Formacao(),
    Experiencia()
  ];
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          //iconSize: 20,
          //selectedFontSize: 20,
          //unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Pessoal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page_outlined),
              label: 'Formação',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Experiência',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Meu Perfil"),
      centerTitle: true,
      backgroundColor: Colors.purpleAccent,
    );
  }
 
  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _botao(context, 'Ir para Tela Pessoal', Pessoal()),
            _botao(context, 'Ir para Tela Formação', Formacao()),
            _botao(context, 'Ir para Tela Experiência', Experiencia()),
            _texto(),
          ],
        ),
      ),
    );
  }
 
  _texto() {
    return Text(
      'Tela Home',
      style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.pinkAccent,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
 
  _botao(BuildContext context, String textoBotao, Widget tela) {
    return RaisedButton(
        color: Colors.green,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickNavegacao(context, tela);
        });
  }
 
  _onClickNavegacao(BuildContext context, Widget tela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return tela;
      }),
    );
  }
}
