import 'package:flutter/material.dart';
import 'package:journal/features/auth/presentation/pages/signup_page.dart';
import 'package:journal/features/auth/presentation/widgets/auth_button.dart';
import 'package:journal/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Route<LoginPage> route() => MaterialPageRoute(builder: (context) {
    return const LoginPage();
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Sign In.",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                  ),
                ),
                AuthField(
                  initValue: 'email',
                  obscured: false,
                  controller: usernameController,
                ),
                AuthField(
                  initValue: 'password',
                  obscured: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(buttonText: "Sign In.", onTap: () {},),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(SignUpPage.route());
                          }, 
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 5)
                          ),
                          child: const Text("Sign Up here!", style: TextStyle(color: Colors.lightGreen),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
