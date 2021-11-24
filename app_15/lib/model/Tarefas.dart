import 'package:app_15/helper/TarefasHelper.dart';
 
class Tarefas {
  int id;
  String titulo;
 
  Tarefas(this.titulo);
 
  Tarefas.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["titulo"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
  
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
