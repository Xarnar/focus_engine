import '../entities/alarm_entity.dart';

abstract class AlarmRepository {
  Future<void> saveAlarm(AlarmEntity alarm);
  Future<List<AlarmEntity>> getAlarms();
  Future<void> deleteAlarm(int id);
}