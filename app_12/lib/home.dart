import 'package:flutter/material.dart';
import 'package:app_12/pessoal.dart';
import 'package:app_12/formacao.dart';
import 'package:app_12/experiencia.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentPage = 0;
 
  final telas = [
    Center(child: Text('Bem-vindos ao meu perfil')),
    Pessoal(),
    Formacao(),
    Experiencia(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
          child: ListView(             
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Paloma Ierardi Avelino'),
              accountEmail: Text('ierardipaloma@gmail.com'),
              currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage('assets/images/rock2.jpg'),
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/C4E03AQGQxeW5jaa9CA/profile-displayphoto-shrink_800_800/0/1555042105348?e=1643241600&v=beta&t=WfD8azgb6X3awZPxI8GcrwN0fLMmqhr9QAv6ORiBSR4'),
              ),
            ),
            
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Home'),
              subtitle: Text('Tela inicial do App'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Informações pessoais'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Informações sobre formação academica'),
              trailing: Icon(Icons.contact_page_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiencia'),
              subtitle: Text('Informações sobre experiências profissionais'),
              trailing: Icon(Icons.contact_page),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
          ],
        )),
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
}