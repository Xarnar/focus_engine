import 'package:isar/isar.dart';

part 'alarm_model.g.dart'; // Este archivo se generará solo

@collection
class AlarmModel {
  Id id = Isar.autoIncrement; // Isar requiere un ID

  @Index() // Indexamos el tiempo para búsquedas rápidas
  DateTime? time;
  
  late String challengeType;
  late bool isActive;
  late List<String> microTasks;
}