import 'package:flutter/material.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/presentation/presentation.dart';

class ProfileScreen extends StatefulWidget {
  static String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  const SizedBox(height: 10,),
              Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 200.0,
                    maxHeight: 400.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/5_panchamighavri.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),                                    
                ),                                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.save)),
                ],
              ),
              const Column(
                children: [UpdateProfileForm()],
              )
              
            ])),
          )
        ],
      ),
    ));
  }
}
