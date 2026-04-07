import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // ProviderScope es necesario para que Riverpod funcione en toda la app
  runApp(const ProviderScope(child: FocusEngineApp()));
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
        body: Center(child: Text('Focus Engine: Modo Guerra Activado')),
      ),
    );
  }
}

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar el motor de alarmas
  await AndroidAlarmManager.initialize();
  
  runApp(const ProviderScope(child: FocusEngineApp()));
}