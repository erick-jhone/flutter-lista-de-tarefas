import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  //Save salvará uma tarefa no banco de dados
  save(Tasks tarefa) async {
    print("Iniciando o sabve: ");
    //Abrindo banco de dados:
    final Database bancoDeDados = await getDatabase();
    //Verifico se a tarefa já existe:
    var itemExists = await find(tarefa.nome);
    Map<String,dynamic> taskMap = toMap(tarefa);
    // Se não existir é inserida
    if (itemExists.isEmpty) {
      print('A tarefa não existia');
      return await bancoDeDados.insert(
        _tablename,taskMap);
    } else { // Se já existia, acessamos o banco e alteramos os dados
      print('A tarefa já existia!');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  //findAll procurará uma tarefa no banco de dados
  Future<List<Tasks>> findAll() async {
    print('Acessando o find All: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... Encontrado: $result');
    return toList(result);
  }



  //Busca uma tarefa específica, passando como parâmetro o nome da tarefa
  Future<List<Tasks>> find(String nomeDaTarefa) async {
    print("Acessando find: ");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  // Deleta tarefa
  delete(String nomeDaTarefa) async {
    print('Deletando tarefa:  $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);

  }

//Converte mapa para lista de tarefas
List<Tasks> toList(List<Map<String, dynamic>> listaDeTarefas) {
  print('Covertando to List: ');
  final List<Tasks> tarefas = [];
  for (Map<String, dynamic> linha in listaDeTarefas) {
    final Tasks tarefa =
    Tasks(linha[_name], linha[_image], linha[_difficulty]);
    tarefas.add(tarefa);
  }
  print('Lista de tarefas $tarefas');
  return tarefas;
}

//Converte lista para mapa

Map<String,dynamic> toMap(Tasks tarefa){
  print('Convertendo Tarefa em Map');
  final Map<String,dynamic> mapaDeTarefas = Map();
  mapaDeTarefas[_name] = tarefa.nome;
  mapaDeTarefas[_difficulty] = tarefa.dificuldade;
  mapaDeTarefas[_image] = tarefa.foto;
  print('Mapa de tarefas: $mapaDeTarefas');
  return mapaDeTarefas;



}





} // Fim da classe
