import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';


class LookigFriends extends StatefulWidget {
  final PostModel m;
  const LookigFriends({super.key, required this.m});

  @override
  State<LookigFriends> createState() => _LookigFriendsState();
}

class _LookigFriendsState extends State<LookigFriends> {
  ValueNotifier<bool> expandListener = ValueNotifier<bool>(false);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400.0,
                maxHeight: 100.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.m.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("  ${widget.m.user.userName}  "),
                  IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.add))
                ],                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
