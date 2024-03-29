import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utinder/domain/domain.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.m,
  });

  final PostModel m;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // ValueListenable expandListener = ValueListenable();
  ValueNotifier<bool> expandListener = ValueNotifier<bool>(false);
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400.0,
                maxHeight: 800.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  widget.m.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.heart,
                    color: isClicked
                        ? Colors.orange.shade700
                        : Colors.black, // Cambia el color según el estado
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.chat_bubble_2,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: expandListener,
              builder: (context, value, _) {
                return GestureDetector(
                  onTap: widget.m.caption.length > 50
                      ? () {
                          expandListener.value = !value;
                        }
                      : null,
                  child: Text.rich(
                    TextSpan(
                      text: widget.m.user.userName,
                      children: [
                        TextSpan(
                          text: widget.m.caption.length > 50 && !value
                              ? " ${widget.m.caption.substring(0, 50)}"
                              : " ${widget.m.caption}",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        widget.m.caption.length > 50
                            ? TextSpan(
                                text: value ? "" : " ...more",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w200,
                                ),
                              )
                            : const TextSpan(),
                      ],
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    expandListener.dispose();
    super.dispose();
  }
}

void _showDialog(BuildContext context) {
  TextEditingController commentController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Comentarios'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño principal
          children: [
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                // Lógica para la opción 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                // Lógica para la opción 2
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Opción 3'),
              onTap: () {
                // Lógica para la opción 3
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16), // Espacio adicional
            Expanded(
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: 'Añadir comentario...',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para agregar el comentario
                String comment = commentController.text;
                // Aquí puedes realizar acciones con el comentario, como guardarlo o enviarlo.
                print('Comentario agregado: $comment');
                Navigator.pop(context);
              },
              child: Text('Agregar Comentario'),
            ),
          ],
        ),
      );
    },
  );
}
