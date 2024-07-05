import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:journal/features/auth/presentation/pages/login_page.dart';
import 'package:journal/features/auth/presentation/widgets/auth_button.dart';
import 'package:journal/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static route() => MaterialPageRoute(builder: (context) {
        return const SignUpPage();
      });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            onPressed: () {
              Navigator.of(context).push(LoginPage.route());
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Sign Up.",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                  ),
                ),
                AuthField(
                  initValue: 'email',
                  obscured: false,
                  controller: emailController,
                ),
                AuthField(
                  initValue: 'username',
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
                AuthButton(
                  buttonText: "Sign Up.",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                                username: usernameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim()),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(LoginPage.route());
                          },
                          style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5)),
                          child: const Text(
                            "Sign In here!",
                            style: TextStyle(color: Colors.lightGreen),
                          ))
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
