import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/flutter.png', 3),
    Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    Tasks('Jogar', 'assets/images/jogar.jpg', 1,),
  ];



  void newTask(String name, String photo, int difficulty){
    taskList.add(Tasks(name, photo, difficulty));
  }

   static TaskInherited of(BuildContext context) {
     final TaskInherited? result =
     context.dependOnInheritedWidgetOfExactType<TaskInherited>();
     assert(result != null, 'No TaskInherited found in context');
     return result!;
   }
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
