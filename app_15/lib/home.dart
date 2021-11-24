import 'package:flutter/material.dart';
import 'package:app_15/helper/TarefasHelper.dart';
import 'package:app_15/model/Tarefas.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  var _db = TarefasHelper();
  List<Tarefas> _tarefas = List<Tarefas>();
 
  _exibirTelaCadastro({Tarefas tarefas}) {
    String textoSalvarAtualizar = "";
    if (tarefas == null) {
      //salvando
      _tituloController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _tituloController.text = tarefas.titulo;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar tarefas"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digite título..."),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarTarefas(tarefasSelecionada: tarefas);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarTarefas() async {
    List tarefasRecuperadas = await _db.recuperarTarefas();
 
    List<Tarefas> listaTemporaria = List<Tarefas>();
    for (var item in tarefasRecuperadas) {
      Tarefas tarefas = Tarefas.fromMap(item);
      listaTemporaria.add(tarefas);
    }
 
    setState(() {
      _tarefas = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }
 
  _salvarAtualizarTarefas({Tarefas tarefasSelecionada}) async {
    String titulo = _tituloController.text;
 
    if (tarefasSelecionada == null) {
      //salvar
      Tarefas tarefas =
          Tarefas(titulo);
      int resultado = await _db.salvarTarefas(tarefas);
    } else {
      //atualizar
      tarefasSelecionada.titulo = titulo;
      int resultado = await _db.atualizarTarefas(tarefasSelecionada);
    }
 
    _tituloController.clear();
 
    _recuperarTarefas();
  }
 
  _removerTarefas(int id) async {
    await _db.removerTarefas(id);
 
    _recuperarTarefas();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarTarefas();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas tarefas"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefas = _tarefas[index];
 
                    return Card(
                      child: ListTile(
                        title: Text(tarefas.titulo),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(tarefas: tarefas);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerTarefas(tarefas.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
 
