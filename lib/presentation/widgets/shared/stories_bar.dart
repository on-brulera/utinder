import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class Stories extends StatelessWidget {
  const Stories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ...stories
            .map(
              (u) => StoryBackGround(
                bottomText: u.userName,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    u.assetName,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList()
      ],
    );
  }
}

class StoryBackGround extends StatelessWidget {
  const StoryBackGround({
    super.key,
    required this.child,
    required this.bottomText,
  });

  final Widget child;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(6),
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepOrange.shade300,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
        Text(
          bottomText,
          style: const TextStyle(
            fontSize: 10,
          ),
        )
      ],
    );
  }
}
