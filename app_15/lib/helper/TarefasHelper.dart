import 'package:app_15/model/Tarefas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class TarefasHelper {
  static final String nomeTabela = "tarefas";
 
  static final TarefasHelper _tarefasHelper = TarefasHelper._internal();
  Database _db;
 
  factory TarefasHelper() {
    return _tarefasHelper;
  }
 
  TarefasHelper._internal() {}
 
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
        "titulo VARCHAR, "
        "descricao TEXT, "
        "data DATETIME)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_tarefas.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarTarefas(Tarefas tarefas) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, tarefas.toMap());
    return resultado;
  }
 
  recuperarTarefas() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC ";
    List tarefas = await bancoDados.rawQuery(sql);
    return tarefas;
  }
 
  Future<int> atualizarTarefas(Tarefas tarefas) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, tarefas.toMap(),
        where: "id = ?", whereArgs: [tarefas.id]);
  }
 
  Future<int> removerTarefas(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
