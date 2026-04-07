import 'package:audioplayers/audioplayers.dart';

class AlarmHandler {
  // Esta función DEBE ser estática o de nivel superior
  @pragma('vm:entry-point')
  static void fireAlarm() async {
    final player = AudioPlayer();
    // Usa un link de sonido online para probar rápido o un asset
    await player.play(UrlSource('https://www.soundjay.com/buttons/beep-01a.mp3'));
    print("¡MODO GUERRA ACTIVADO! Despierta, ingeniero.");
  }
}