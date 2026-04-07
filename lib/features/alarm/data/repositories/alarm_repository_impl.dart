import 'package:isar/isar.dart';
import '../../domain/entities/alarm_entity.dart';
import '../../domain/repositories/alarm_repository.dart';
import '../models/alarm_model.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  final Isar isar;

  AlarmRepositoryImpl(this.isar);

  @override
  Future<void> saveAlarm(AlarmEntity alarm) async {
    final model = AlarmModel()
      ..id = alarm.id == 0 ? Isar.autoIncrement : alarm.id
      ..time = alarm.time
      ..challengeType = alarm.challengeType
      ..isActive = alarm.isActive
      ..microTasks = alarm.microTasks;

    await isar.writeTxn(() => isar.alarmModels.put(model));
  }

  @override
  Future<List<AlarmEntity>> getAlarms() async {
    final models = await isar.alarmModels.where().findAll();
    return models.map((m) => AlarmEntity(
      id: m.id,
      time: m.time ?? DateTime.now(),
      challengeType: m.challengeType,
      isActive: m.isActive,
      microTasks: m.microTasks,
    )).toList();
  }
  
  @override
  Future<void> deleteAlarm(int id) async => await isar.writeTxn(() => isar.alarmModels.delete(id));
}