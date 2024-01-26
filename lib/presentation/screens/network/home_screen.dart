import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:utinder/presentation/presentation.dart';

class HomeScreen extends StatefulWidget {
  static String name = 'home_screen_view';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: kIsWeb
                  ? MediaQuery.of(context).size.width * 1.5
                  : MediaQuery.of(context).size.width * 1.7,
              bottom: kIsWeb ? -500 : 200,
              left: kIsWeb ? 300 : 100,
              height: kIsWeb ? MediaQuery.of(context).size.width * 1 : 200,
              // child: Placeholder()),
              child: Image.asset('assets/Backgrounds/Spline.png')),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          )),
          // if (!kIsWeb)
            // const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          if (!kIsWeb)
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            )),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            top: isSignInDialogShown ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: kIsWeb ? 700 : 270,
                      child: Column(children: [
                        TitleNetwork(),
                        SizedBox(
                          height: 16,
                        ),
                        SubTitleNetwork(),
                      ]),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AnimatedBtn(
                        btnAnimationController: _btnAnimationController,
                        press: () {
                          _btnAnimationController.isActive = true;
                          Future.delayed(const Duration(milliseconds: 800), () {
                            setState(() {
                              isSignInDialogShown = true;
                            });
                            customSigninDialog(context, onClosed: (_) {
                              setState(() {
                                isSignInDialogShown = false;
                              });
                            });
                          });
                        }),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: WarningNetwork(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
