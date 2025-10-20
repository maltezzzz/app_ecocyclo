import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(),
        onMediaCaptureEvent: (event) async {
          if (event.status == MediaCaptureStatus.success && event.isPicture) {
            // Captura única (foto)
            await event.captureRequest.when(
              single: (single) async {
                final file = single.file;
                if (file != null) {
                  debugPrint("📸 Foto salva em: ${file.path}");
                  Navigator.pop(context, file.path);
                }
              },
              multiple: (multiple) async {
                // Caso esteja usando mais de uma câmera
                for (final entry in multiple.fileBySensor.entries) {
                  final sensor = entry.key;
                  final file = entry.value;
                  debugPrint("📸 Sensor: $sensor, arquivo: ${file?.path}");
                }
              },
            );
          }
        },
      ),
    );
  }
}