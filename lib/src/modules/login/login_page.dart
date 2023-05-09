import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/app_colors.dart';
import '../../core/ui/styles/text_styles.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Modular.get<LoginController>();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenShortedSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;

    return Scaffold(
      backgroundColor: context.color.back,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenShortedSide * .5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/lanche.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: screenShortedSide * .5,
            padding: EdgeInsets.only(top: context.percentHeight(.10)),
            child: Image.asset('assets/images/logo.png'),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: context.percentWidth(screenWidth < 1300 ? .7 : .3),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FractionallySizedBox(
                        widthFactor: .3,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                            Text('Login', style: context.textStyles.textTitle),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'E-mail'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.login('email', 'password');
                          },
                          child: const Text('Entrar'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
