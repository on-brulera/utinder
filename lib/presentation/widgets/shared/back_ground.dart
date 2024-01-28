import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utinder/presentation/presentation.dart';

class BackGround extends ConsumerWidget {
  const BackGround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    final selectedIndex = ref.watch(navigatorProvider);
    final bool isDark = ref.watch(themeScreenNotifierProvider);
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
                      onPressed: () {
                        ref
                            .watch(navigatorProvider.notifier)
                            .setIndexNavigator(index: 1);
                        context.goNamed(PostsScreen.name);
                      },
                      icon: activateIconButon(
                          1, selectedIndex, Icons.home_filled),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .watch(navigatorProvider.notifier)
                            .setIndexNavigator(index: 2);
                        context.goNamed(LookingForScreen.name);
                      },
                      icon: activateIconButon(
                          2, selectedIndex, CupertinoIcons.search),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .watch(navigatorProvider.notifier)
                            .setIndexNavigator(index: 3);
                        context.goNamed(ForYouScreen.name);
                      },
                      icon: activateIconButon(
                          3, selectedIndex, Icons.add_box_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .watch(navigatorProvider.notifier)
                            .setIndexNavigator(index: 4);
                        context.goNamed(ForYouScreen.name);
                        context.goNamed(ProfileScreen.name);
                      },
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

Widget activateIconButon(int index, int navigator, IconData icon) {
  if (index == navigator) {
    return Icon(
      icon,
      color: Colors.orange.shade700,
    );
  }
  return Icon(icon);
}
