import 'package:flutter/material.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/presentation/presentation.dart';

class PostsScreen extends StatefulWidget {
  static String name = 'post_screen';
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
              const Center(child: Text("Seguidores")),
              const SizedBox(
                height: 110,
                child: Stories(),
              ),
              const SizedBox(height: 20),
              postForm(),
              const SizedBox(height: 20),
              const Text("Trending Posts"),
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
