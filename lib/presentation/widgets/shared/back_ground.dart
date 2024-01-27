import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/presentation/presentation.dart';

class BackGround extends ConsumerWidget {
  const BackGround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    final bool isDark = ref.watch(isDarkMode);
    return Stack(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor,
                  if (isDark) ...[
                    Colors.orange.withOpacity(.1),
                    Colors.blue.withOpacity(.2),
                  ],
                  if (!isDark) ...[
                    Colors.orange.shade100,
                    Colors.blue.shade100,
                  ],
                ],
              ),
            ),
          ),
        ),
        Positioned(top: 0, bottom: 80, left: 0, right: 0, child: child),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_filled,
                        color: Colors.orange.shade700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.search),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_box_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(122),
                        child: Image.asset(
                          'assets/0_me.jpeg',
                          fit: BoxFit.cover,
                          height: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
