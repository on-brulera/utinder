import 'package:flutter/material.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/presentation/presentation.dart';
import 'package:utinder/presentation/widgets/shared/looking_profiles.dart';

class LookingForScreen extends StatefulWidget {
  static String name = 'looking_for_screen';
  const LookingForScreen({super.key});

  @override
  State<LookingForScreen> createState() => _LookingForScreenState();
}

class _LookingForScreenState extends State<LookingForScreen> {
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
              lookingForm(),
              ...posts.map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: LookigFriends(
                    m: e,
                  ),
                ),
              ),
            ])),
          ),
        ],
      ),
    ));
  }
}
