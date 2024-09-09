import 'package:flutter/material.dart';

import '../model/cinema.dart';

class SelecionarCinemaPage extends StatefulWidget {
  const SelecionarCinemaPage({super.key});

  @override
  State<SelecionarCinemaPage> createState() => _SelecionarCinemaPageState();
}

class _SelecionarCinemaPageState extends State<SelecionarCinemaPage> {

  List<Cinema> cinemas = [
    Cinema(
      nome: 'Cinema Central',
      endereco: 'Rua das Flores, 123',
      telefone: '(11) 98765-4321',
      imagem: 'assets/images/cinema_central.jpg',
      cidade: 'São Paulo',
    ),
    Cinema(
      nome: 'Cine Plaza',
      endereco: 'Av. Paulista, 900',
      telefone: '(11) 99876-5432',
      imagem: 'assets/images/cine_plaza.jpg',
      cidade: 'São Paulo',
    ),
    Cinema(
      nome: 'Cine Arte',
      endereco: 'Rua Augusta, 450',
      telefone: '(11) 91234-5678',
      imagem: 'assets/images/cine_arte.jpg',
      cidade: 'São Paulo',
    ),
    Cinema(
      nome: 'Cine Max',
      endereco: 'Av. Ipiranga, 700',
      telefone: '(21) 92345-6789',
      imagem: 'assets/images/cine_max.jpg',
      cidade: 'Rio de Janeiro',
    ),
    Cinema(
      nome: 'Cine Lux',
      endereco: 'Praça da Sé, 100',
      telefone: '(21) 93456-7890',
      imagem: 'assets/images/cine_lux.jpg',
      cidade: 'Rio de Janeiro',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.white),
        centerTitle: true,
        title: const Text('Cinemas', style: TextStyle(color: Colors.white, fontSize: 18)),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          children: [
            // Text('Fique à vontade para escolher o cinema de sua preferência!', textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
            // SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Cinema',
                hintText: 'Digite o nome do cinema',
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.movie),
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: cinemas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      // leading: Image.asset(cinemas[index].imagem),
                      title: Text('${cinemas[index].nome} - ${cinemas[index].cidade}', style: const TextStyle(fontSize: 18)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: Theme.of(context).primaryColor),
                              SizedBox(width: 4),
                              Text(cinemas[index].endereco, style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.phone_outlined, color: Theme.of(context).primaryColor),
                              SizedBox(width: 4),
                              Text(cinemas[index].telefone, style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                      // trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).pushNamed('/filmes', arguments: cinemas[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
