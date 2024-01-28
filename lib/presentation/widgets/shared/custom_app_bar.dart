import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/presentation/presentation.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final bool isDark = ref.watch(themeScreenNotifierProvider);

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      primary: true,
      title:  Row(
        children: [
          Image.asset(
            'assets/tinder.png',
            height: 45,
          ),
          const SizedBox(width: 10),
          const TitleNetwork(logo: true),
        ],
      ),
      actions: [        
        Consumer(builder: (context, watch, _) {
          return IconButton(
            onPressed: () {
              ref.watch(themeScreenNotifierProvider.notifier).toggleDarkMode();
            },
            icon: isDark
                ? const Icon(
                    Icons.sunny,
                  )
                : const Icon(CupertinoIcons.moon_fill),
          );
        }),
        const SizedBox(width: 15,)
      ],
    );
  }
}
