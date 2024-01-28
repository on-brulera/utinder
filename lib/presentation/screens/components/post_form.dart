import 'package:flutter/material.dart';

ExpansionTile postForm() => ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title:const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Agregar Post",
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
              hintText: "Escribe tu post aquí",
              border: InputBorder.none,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Lógica para seleccionar una imagen
              },
              child: const Text("Adjuntar Imagen"),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar el post
              },
              child: const Text("Postear"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
        // Puedes agregar aquí el código para mostrar la imagen seleccionada si es necesario
      ],
    );
