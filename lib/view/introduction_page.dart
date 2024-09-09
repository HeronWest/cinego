import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configuration_page.dart';
import 'login_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Bem vindo ao CineGO!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SvgPicture.asset(
                  height: 400,
                  'assets/images/film_rols.svg',
                  fit: BoxFit.contain,
                ),
                //Texto "Login"
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton(

                    onPressed: () {
                      // Navegar para a próxima tela
                    },
                    child: Text('Cadastrar', style: GoogleFonts.nunito()),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      // foregroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontSize: 18),
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text('Entrar', style: GoogleFonts.nunito()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfigurationPage()),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
