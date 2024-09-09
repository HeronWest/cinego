import 'package:cinego/view/introduction_page.dart';
import 'package:cinego/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineGO',
      theme: ThemeData(
        primaryColor: Color(0xFFA3063F), // Cor primária
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFA3063F), // Cor primária
          secondary: Color(0xFF19233C), // Cor secundária
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA3063F),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,

          ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            )
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFA3063F), // Cor primária para o FAB
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF19233C), // Cor secundária para os botões
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Color(0xFFA3063F), // Cor primária para os botões elevados
            ),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            elevation: WidgetStateProperty.all(3),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        fontFamily: GoogleFonts.nunito().fontFamily,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xFFA3063F), // Cor primária para o campo focado
              width: 1.5
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA3063F),
              width: 2.5, // Cor primária para o campo focado
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: IntroductionPage(),
    );
  }
}
