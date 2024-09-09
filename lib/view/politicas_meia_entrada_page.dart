import 'package:flutter/material.dart';

class PoliticasMeiaEntradaPage extends StatelessWidget {
  const PoliticasMeiaEntradaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Políticas de Meia Entrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Quem tem direito à meia-entrada?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Estudantes devidamente matriculados em instituições de ensino, mediante a apresentação da Carteira de Identificação Estudantil (CIE).',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              '2. Idosos com idade igual ou superior a 60 anos, mediante a apresentação de documento de identidade com foto.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              '3. Pessoas com deficiência e seus acompanhantes, quando necessário, mediante a apresentação de documento que comprove a condição de deficiência.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              '4. Jovens de baixa renda com idade entre 15 e 29 anos, mediante a apresentação da Identidade Jovem.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Documentos necessários:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Para usufruir do benefício da meia-entrada, é necessário apresentar um documento válido que comprove o direito ao benefício no momento da compra e na entrada do evento junto a um documento oficial com foto.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}