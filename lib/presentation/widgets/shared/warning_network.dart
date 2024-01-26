import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WarningNetwork extends StatelessWidget {
  const WarningNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle estilos = kIsWeb
      ? const TextStyle(color: Colors.black38)
      : const TextStyle(fontSize: 10, color: Colors.black38);
    String texto =
        "La información es responsabilidad exclusiva de los autores.";
    return Text(texto, style: estilos);
  }
}
