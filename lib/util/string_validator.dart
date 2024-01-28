bool isEmail(String email) {
  // Expresión regular para verificar el formato de un correo electrónico
  RegExp regExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
    multiLine: false,
  );

  // Verificar si el input coincide con la expresión regular
  return regExp.hasMatch(email);
}
