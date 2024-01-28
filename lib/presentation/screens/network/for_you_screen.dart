import 'package:flutter/material.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/presentation/presentation.dart';

class ForYouScreen extends StatefulWidget {
  static String name = 'for_you_screen';
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  @override
  Widget build(BuildContext context) {
    return BackGround(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
                delegate: SliverChildListDelegate([                          
              const SizedBox(height: 20),
              ...posts.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: PostCard(
                          m: e,
                        ),
                      ),
                    ),
            ])),
          )
        ],
      ),
    ));
  }
}
