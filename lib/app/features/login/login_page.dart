import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najlepsza_vege_knajpa/app/features/login/cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final paswordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isCreatingAccount == true
                        ? 'Zarejestruj się'
                        : 'Zaloguj się'),
                    const SizedBox(height: 20),
                    TextField(
                      controller: widget.emailController,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                    ),
                    TextField(
                      controller: widget.paswordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Hasło'),
                    ),
                    const SizedBox(height: 20),
                    Text(errorMessage),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().login();
                      },
                      child: Text(isCreatingAccount == true
                          ? 'Zarejestruj się'
                          : 'Zaloguj się'),
                    ),
                    const SizedBox(height: 20),
                    if (isCreatingAccount == false) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = true;
                          });
                        },
                        child: const Text(
                          'Utwórz konto',
                        ),
                      ),
                    ],
                    if (isCreatingAccount == true) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = false;
                          });
                        },
                        child: const Text(
                          'Masz już konto?',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
