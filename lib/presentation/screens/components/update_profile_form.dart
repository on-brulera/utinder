import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:utinder/presentation/presentation.dart';
import 'package:utinder/util/util.dart';

class UpdateProfileForm extends ConsumerStatefulWidget {
  const UpdateProfileForm({
    super.key,
  });

  @override
  ConsumerState<UpdateProfileForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<UpdateProfileForm> {
  String selectedFaculty = "FICA";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _namesController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void updateProfile(BuildContext context) async {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        // show success
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.read(sessionProvider);
    const passwordBottom = (kIsWeb) ? 16 : 0;
    const buttonBottom = (kIsWeb) ? 24 : 0;
    return Stack(
      children: [
        Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                parameterTitle('Nombre y Apellido'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: TextFormField(
                    controller: _namesController,
                    validator: (value) {
                      if (value!.isEmpty) return "El nombre es obligatorio";
                      return null;
                    },
                    onSaved: (email) {},
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.edit_document),
                    )),
                  ),
                ),
                parameterTitle('Username'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) return 'El username es obligatorio';
                      return null;
                    },
                    onSaved: (email) {},
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.person_2_rounded),
                    )),
                  ),
                ),
                parameterTitle('Facultad'),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: DropdownButtonFormField<String>(
                      value: selectedFaculty,
                      onChanged: (value) {
                        setState(() {
                          selectedFaculty = value!;
                        });
                      },
                      items: ["FICA", "FACAE", "FICAYA", "FCCSS"]
                          .map((faculty) => DropdownMenuItem(
                                value: faculty,
                                child: Text(faculty),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.school),
                        ),
                      ),
                    )),
                parameterTitle('Email'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) return "El email es necesario";
                      if (!isEmail(value)) return "Ingrese un email válido";
                      return null;
                    },
                    onSaved: (email) {},
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    )),
                  ),
                ),
                parameterTitle('Password'),
                Padding(
                  padding: EdgeInsets.only(
                      top: 8.0, bottom: passwordBottom.toDouble()),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) return "El password es obligatorio";
                      return null;
                    },
                    onSaved: (password) {},
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    )),
                  ),
                ),
                if (kIsWeb) const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                      top: 9.0, bottom: buttonBottom.toDouble()),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        ref.watch(sessionProvider.notifier).register(
                            email: _emailController.text,
                            name: _namesController.text,
                            password: _passwordController.text,
                            username: _usernameController.text,
                            faculty: selectedFaculty);
                        if (session.token == 'NoToken') {
                          _emailController.text = '';
                          _namesController.text = '';
                          _passwordController.text = '';
                          _usernameController.text = '';
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Error"),
                                content: const Text(
                                    "Ingrese los datos correctamente, el username y email deben ser únicos"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          updateProfile(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)))),
                      icon: const Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Color(0xFFFE0037),
                      ),
                      label: const Text("Actualizar")),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 9.0, bottom: buttonBottom.toDouble()),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)))),
                      icon: const Icon(
                        Icons.delete,
                        color: Color(0xFFFE0037),
                      ),
                      label: const Text("Eliminar")),
                ),
              ],
            )),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                "assets/RiveAssets/check.riv",
                onInit: (artboard) {                  
                },
              ))
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                scale: 6,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: (artboard) {                    
                  },
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}
