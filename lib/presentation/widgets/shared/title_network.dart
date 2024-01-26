import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class TitleNetwork extends StatelessWidget {
  const TitleNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    String texto = "UTiNder 🔥";

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: kIsWeb
          ?120
          :60,
          fontFamily: "Poppins",
          height: 1.2,
          color: Colors.black
        ),
        children: <TextSpan>[
          TextSpan(
            text: texto.substring(0, 2), // Primera letra
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          TextSpan(
            text: texto.substring(2, 3), // Segunda y tercera letras
          ),
          TextSpan(
            text: texto.substring(3, 4), // Cuarta letra (N)
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          TextSpan(
            text: texto.substring(4), // Resto del texto
          ),
        ],
      ),
    );
  }
}