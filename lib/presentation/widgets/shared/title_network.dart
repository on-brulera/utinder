import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/presentation/presentation.dart';

class TitleNetwork extends ConsumerWidget {
  final bool logo;
  const TitleNetwork({super.key, this.logo = false});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDark = ref.watch(themeScreenNotifierProvider);
    String texto = "UTiNder";
    double sizeFont = kIsWeb ? 120 : 60;
    Color defaulColor = isDark? Colors.white: Colors.black;
    if (logo) sizeFont = kIsWeb ? 35 : 33;

    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: sizeFont,
            fontFamily: "Poppins",
            height: 1.2,
            color: defaulColor),
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
