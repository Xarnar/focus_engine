import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

// Importa tus propios archivos (ajusta 'focus_engine' si tu proyecto se llama distinto)
import 'package:focus_engine/core/config/env_config.dart';
import 'package:focus_engine/core/network/isar_provider.dart';
import 'package:focus_engine/features/alarm/data/models/alarm_model.dart';

void main() async { // <--- El 'async' es vital para usar 'await'
  // 1. Asegurar que los canales nativos estén listos
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Cargar variables de entorno (.env)
  await EnvConfig.init();
  
  // 3. Inicializar Isar (Base de datos local)
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AlarmModelSchema], 
    directory: dir.path,
  );

  // 4. Inicializar el motor de alarmas de Android
  await AndroidAlarmManager.initialize();

  runApp(
    ProviderScope(
      overrides: [
        // Inyectamos la instancia de Isar en nuestro provider
        isarProvider.overrideWithValue(isar),
      ],
      child: const FocusEngineApp(),
    ),
  );
}

class FocusEngineApp extends StatelessWidget {
  const FocusEngineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Engine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bolt, size: 100, color: Colors.orange),
              Text(
                'FOCUS ENGINE',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text('Modo Guerra: Activado'),
            ],
          ),
        ),
      ),
    );
  }
}