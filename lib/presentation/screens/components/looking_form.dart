import 'package:flutter/material.dart';

ExpansionTile lookingForm() => ExpansionTile(
      initiallyExpanded: true,
      tilePadding: EdgeInsets.zero,
      title:const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Buscar Amigos",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Busca su usuario",
              border: InputBorder.none,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [            
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar el post
              },
              child: const Text("Buscar"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
        // Puedes agregar aquí el código para mostrar la imagen seleccionada si es necesario
      ],
    );
