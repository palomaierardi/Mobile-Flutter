import 'package:flutter/material.dart';
import 'package:app_16/helper/ComprasHelper.dart';
import 'package:app_16/model/Compras.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _mercadoriaController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  var _db = ComprasHelper();
  List<Compras> _compras = List<Compras>();
 
  _exibirTelaCadastro({Compras compras}) {
    String textoSalvarAtualizar = "";
    if (compras == null) {
      //salvando
      _mercadoriaController.text = "";
      _quantidadeController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _mercadoriaController.text = compras.mercadoria;
      _quantidadeController.text = compras.quantidade;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar compras"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _mercadoriaController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Mercadoria", hintText: "Digite a mercadoria..."),
                ),
                TextField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(
                      labelText: "Quantidade", hintText: "Digite a quantidade..."),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarCompras(comprasSelecionada: compras);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarCompras() async {
    List comprasRecuperadas = await _db.recuperarCompras();
 
    List<Compras> listaTemporaria = List<Compras>();
    for (var item in comprasRecuperadas) {
      Compras compras = Compras.fromMap(item);
      listaTemporaria.add(compras);
    }
 
    setState(() {
      _compras = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }
 
  _salvarAtualizarCompras({Compras comprasSelecionada}) async {
    String mercadoria = _mercadoriaController.text;
    String quantidade = _quantidadeController.text;
 
    if (comprasSelecionada == null) {
      //salvar
      Compras compras =
          Compras(mercadoria, quantidade, DateTime.now().toString());
      int resultado = await _db.salvarCompras(compras);
    } else {
      //atualizar
      comprasSelecionada.mercadoria = mercadoria;
      comprasSelecionada.quantidade = quantidade;
      comprasSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarCompras(comprasSelecionada);
    }
 
    _mercadoriaController.clear();
    _quantidadeController.clear();
 
    _recuperarCompras();
  }
 
  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
 
    //Year -> y month-> M Day -> d
    // Hour -> H minute -> m second -> s
    //var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");
 
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
 
    return dataFormatada;
  }
 
  _removerCompras(int id) async {
    await _db.removerCompras(id);
 
    _recuperarCompras();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarCompras();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas compras"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _compras.length,
                  itemBuilder: (context, index) {
                    final compras = _compras[index];
 
                    return Card(
                      child: ListTile(
                        title: Text(compras.mercadoria),
                        subtitle: Text(
                            "${_formatarData(compras.data)} - ${compras.quantidade}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(compras: compras);
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
                                _removerCompras(compras.id);
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
