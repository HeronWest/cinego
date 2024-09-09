import 'dart:developer';

import 'package:cinego/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LocalAuthentication auth;
  bool _supportsBiometrics = false;
  bool _habilitarBiometria = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((value) {
      setState(() {
        _supportsBiometrics = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 32,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // FractionallySizedBox(
                //   widthFactor: 1,
                //   child: SvgPicture.asset(
                //     'assets/images/film_rols.svg',
                //   ),
                // ),
                //Texto "Login"
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 64),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 16),
                //Checkbox habilitar biometria
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _habilitarBiometria,
                        onChanged: (value) {
                          setState(() {
                            _habilitarBiometria = value!;
                          });
                        },

                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('Habilitar biometria', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 32),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(emailController.text.isEmpty || passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('Preencha todos os campos.'),
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            showCloseIcon: true,
                          ),
                        );
                        return;
                      }

                      if(emailController.text != 'teste@gmail.com.br' || passwordController.text != '123456') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('E-mail ou senha inválidos.'),
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            showCloseIcon: true,
                          ),
                        );
                        return;
                      }

                      if(_supportsBiometrics && _habilitarBiometria) {
                        bool authenticated = false;
                        try {
                          authenticated = await auth.authenticate(
                            localizedReason: 'Autentique-se para acessar o aplicativo.',
                            options: const AuthenticationOptions(
                              stickyAuth: true,
                              useErrorDialogs: true,
                            ),
                            authMessages: [
                              const AndroidAuthMessages(
                                cancelButton: 'Cancelar',
                                goToSettingsButton: 'Configurações',
                                goToSettingsDescription: 'Por favor, configure sua biometria.',
                                biometricHint: 'Toque no sensor',
                                signInTitle: 'Autenticação',
                              )
                            ]
                          );
                        } catch (e) {
                          log(e.toString());
                        }

                        if(authenticated) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
                        }
                      } else {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
                      }

                    },
                    child: const Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Esqueceu a senha?'),
                    TextButton(
                      onPressed: () {
                        // Navegar para a próxima tela
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                      child: const Text('Clique aqui para recuperar.'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),


    );
  }
}
