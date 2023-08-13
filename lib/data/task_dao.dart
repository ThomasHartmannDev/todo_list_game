import 'package:sqflite/sqflite.dart';
import 'package:todo_list_game/data/database.dart';

import '../components/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  //CRUD methods
  //CREATE AND UPDATE
  save(Task task) async {
    print('Iniciando Save: ');
    final Database database = await getDatabase();
    var itemExist = await find(task.nome);
    Map<String,dynamic> taskMap = toMap(task);
    if(itemExist.isEmpty){
      print('A tarefa não existia');
      return await database.insert(_tablename, taskMap);
    } else {
      print('A Tarefa já Existia');
      return await database.update(_tablename, taskMap, where: '$_name = ?', whereArgs: [task.nome]);
    }
  }
  // Map do tipo String nas chaves e Dynamic nos valores.
  Map<String, dynamic>toMap(Task task){
    print('Convertendo Tarefa em Map');
    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.nome;
    taskMap[_difficulty] = task.dificuldade;
    taskMap[_image] = task.foto;
    print('Mapa de tarefas: $taskMap');
    return taskMap;
  }
  //READ
  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('Procurnado dado na DB... Encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print('Convertendo to List: ');
    final List<Task> taskList = [];
    for (Map<String, dynamic> row in taskMap) {
      final Task task = Task(row[_name], row[_image], row[_difficulty]);
      taskList.add(task);
    }
    print('Lista de tarefas: $taskList');
    return taskList;
  }
  //READ
  Future<List<Task>> find(String nameTask) async {
    print('Acessando Find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
        _tablename, where: '$_name = ?', whereArgs: [nameTask]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deleting Task: $taskName');

    final Database database = await getDatabase();

    return database.delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }


}

