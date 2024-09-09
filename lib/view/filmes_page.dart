import 'package:cinego/model/filme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'filme/filme_page.dart';

class FilmesPage extends StatefulWidget {
  FilmesPage({super.key});

  @override
  State<FilmesPage> createState() => _FilmesPageState();
}

class _FilmesPageState extends State<FilmesPage> {
  List<Map<String, dynamic>> generos = [
    {'nome': 'Ação', 'icone': Icons.sports_martial_arts},
    {'nome': 'Aventura', 'icone': Icons.explore},
    {'nome': 'Comédia', 'icone': Icons.emoji_emotions},
    {'nome': 'Drama', 'icone': Icons.theater_comedy},
    {'nome': 'Ficção', 'icone': Icons.science},
    {'nome': 'Romance', 'icone': Icons.favorite},
    {'nome': 'Suspense', 'icone': Icons.visibility},
    {'nome': 'Terror', 'icone': Icons.dangerous},
  ];

  DateTime dataSelecionada = DateTime.now();

  TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Genêros dos Filmes',
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: generos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 0,
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Center(
                              child: Icon(
                                generos[index]['icone'],
                                size: 32,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          generos[index]['nome'],
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
            const SizedBox(height: 16),
            Text(
              'Filmes em Cartaz',
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filmesMock.length,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FilmePage(filme: filmesMock[index])));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                filmesMock[index].imagens.first,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                //Classificação indicativa
                                child: Container(
                                  height: 34,
                                  width: 34,
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: filmesMock[index].classificacao >= 18 ? Colors.black : filmesMock[index].classificacao >= 16
                                        ? Colors.red
                                        : filmesMock[index].classificacao >= 14
                                            ? Colors.orange
                                            : filmesMock[index].classificacao >= 12 ? Colors.yellow : Colors.green,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${filmesMock[index].classificacao}',
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 30,
                                        spreadRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 20,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      filmesMock[index].titulo,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Filmes em Breve',
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filmesBreveMock.length,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
        
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                filmesBreveMock[index].imagens.first,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                //Classificação indicativa
                                child: Container(
                                  height: 34,
                                  width: 34,
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: filmesBreveMock[index].classificacao >= 18 ? Colors.black : filmesBreveMock[index].classificacao >= 16
                                        ? Colors.red
                                        : filmesBreveMock[index].classificacao >= 14
                                        ? Colors.orange
                                        : filmesBreveMock[index].classificacao >= 12 ? Colors.yellow : Colors.green,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${filmesBreveMock[index].classificacao}',
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 30,
                                        spreadRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 20,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      filmesBreveMock[index].titulo,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
