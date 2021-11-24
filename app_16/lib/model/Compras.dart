import 'dart:ffi';

import 'package:app_16/helper/ComprasHelper.dart';
 
class Compras {
  int id;
  String mercadoria;
  String quantidade;
  String data;
 
  Compras(this.mercadoria, this.quantidade, this.data);
 
  Compras.fromMap(Map map) {
    this.id = map["id"];
    this.mercadoria = map["mercadoria"];
    this.quantidade = map["quantidade"];
    this.data = map["data"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "Mercadoria": this.mercadoria,
      "Quantidade": this.quantidade,
      "data": this.data,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
