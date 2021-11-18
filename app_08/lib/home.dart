import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  
 
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
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
    );
  }

_corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          Row(
            children: [
              Column(
            children: [
              _foto('iphone8.jpg'),
              _texto('Iphone 8 '),
              _texto2('1989,99 Reais   '),
            ],
          ),
          Column(
            children:[
               _foto('iphoneX.jpg'),
               _texto('Iphone X '),
               _texto2('2999,89 Reais   '), 
            ], 
          ),
          Column(
            children:[
              _foto('iphone11.jpg'),
              _texto('Iphone 11 '),
              _texto2('3949,00 Reais   '),
            ],
          ),
            ],
          ),
          Row(
            children: [
               Column(
            children:[
              _foto('iphone12.jpg'),
              _texto('Iphone 12 '),
              _texto2('5021,07 Reais   '),
            ],
          ),
          Column(
            children:[
              _foto('iphone13.jpg'),
              _texto('Iphone 13 '),
              _texto2('6699,99 Reais'),
            ],
          ), 
            ]
          ),
        ],
      ),
    );
  }
 
  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 200,
      width: 200,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      fit: BoxFit.fill,
    );
  }

 
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blueGrey, fontSize: 35.0),
    );
  }
  _texto2(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
    );
  }
}