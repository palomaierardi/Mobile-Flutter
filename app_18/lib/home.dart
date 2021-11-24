import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController gitController = TextEditingController();
  String info_dev = '';
 
  _recuperarGit() async {
    String url = 'https://api.github.com/users/${gitController.text}';
 
    print(url);
 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    int id = retorno["id"];
    String nome = retorno["name"];
    String repositorio = retorno["repos_url"];
    String criacao = retorno["created_at"];
    int seguidores = retorno["followers"];
    int seguindo = retorno["following"];
 
    setState(() {
      info_dev =
          'Id: $id \n Nome: $nome \n Repositorios: $repositorio \n Criado em: $criacao \n Seguidores: $seguidores \n Seguindo: $seguindo';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Devs"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o login git...",
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: gitController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarGit,
                  child: Icon(Icons.check),
                  color: Colors.blue,
                ),
              ),
            ),
            Text(info_dev),
          ],
        ),
      ),
    );
  }
}
