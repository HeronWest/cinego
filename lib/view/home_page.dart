import 'package:cinego/view/perfil_page.dart';
import 'package:cinego/view/selecionar_cinema_page.dart';
import 'package:flutter/material.dart';

import 'carrinho_page.dart';
import 'filmes_page.dart';
import 'ingressos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Escolher cinema dropdownformfield,
        titleTextStyle: const TextStyle(color: Colors.white),
        centerTitle: true,
        title: TextButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SelecionarCinemaPage()));
            },
            iconAlignment: IconAlignment.end,
            label: const Text('Cinemark - Chapecó', style: TextStyle(color: Colors.white, fontSize: 18)),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white)),
      ),
      body: <Widget>[
        FilmesPage(),
        const IngressosPage(),
        const CarrinhoPage(),
        const PerfilPage(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          indicatorColor: Theme.of(context).colorScheme.primary,
          selectedIndex: _selectedIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(_selectedIndex == 0
                  ? Icons.local_movies
                  : Icons.local_movies_outlined),
              label: 'Filmes',
            ),
            NavigationDestination(
              icon: Icon(_selectedIndex == 1
                  ? Icons.local_activity
                  : Icons.local_activity_outlined),
              label: 'Ingressos',
            ),
            NavigationDestination(
              icon: Icon(_selectedIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined),
              label: 'Carrinho',
            ),
            NavigationDestination(
              icon: Icon(_selectedIndex == 3
                  ? Icons.account_circle
                  : Icons.account_circle_outlined),
              label: 'Perfil',
            ),
          ]),
    );
  }
}
