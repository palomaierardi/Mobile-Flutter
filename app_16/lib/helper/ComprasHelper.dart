import 'package:app_16/model/Compras.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class ComprasHelper {
  static final String nomeTabela = "compras";
 
  static final ComprasHelper _comprasHelper = ComprasHelper._internal();
  Database _db;
 
  factory ComprasHelper() {
    return _comprasHelper;
  }
 
  ComprasHelper._internal() {}
 
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }
 
  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "mercadoria VARCHAR, "
        "quantidade NUMBER, "
        "data DATETIME)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_compras.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarCompras(Compras compras) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, compras.toMap());
    return resultado;
  }
 
  recuperarCompras() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC ";
    List compras = await bancoDados.rawQuery(sql);
    return compras;
  }
 
  Future<int> atualizarCompras(Compras compras) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, compras.toMap(),
        where: "id = ?", whereArgs: [compras.id]);
  }
 
  Future<int> removerCompras(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
