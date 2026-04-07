class AlarmEntity {
  final int id;
  final DateTime time;
  final String challengeType; // 'QR', 'Math', 'Steps'
  final bool isActive;
  final List<String> microTasks; // Protocolo de alerta (Agua, Aseo, etc.)

  AlarmEntity({
    required this.id,
    required this.time,
    required this.challengeType,
    this.isActive = true,
    required this.microTasks,
  });
}