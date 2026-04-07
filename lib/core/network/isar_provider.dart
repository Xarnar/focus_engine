import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/alarm/data/models/alarm_model.dart';

// Este provider inicializa la base de datos
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError(); // Lo inicializaremos en el main
});