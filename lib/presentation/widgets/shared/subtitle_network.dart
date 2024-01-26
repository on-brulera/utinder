import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SubTitleNetwork extends StatelessWidget {
  const SubTitleNetwork({super.key});

  @override
  Widget build(BuildContext context) {    
    String texto =
        "Aplicación para los estudiantes de las facultades de la UTN, menos FECYT.";
    const textValueFont = kIsWeb ? 20 : 14;
    return Text(texto, style: TextStyle(fontSize: textValueFont.toDouble()));
  }
}
