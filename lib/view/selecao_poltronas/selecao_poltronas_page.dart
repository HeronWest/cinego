import 'package:cinego/view/ingressos/preenchimento_ingressos_page.dart';
import 'package:flutter/material.dart';

class SelecaoPoltronasPage extends StatefulWidget {
  const SelecaoPoltronasPage({super.key});

  @override
  State<SelecaoPoltronasPage> createState() => _SelecaoPoltronasPageState();
}

class _SelecaoPoltronasPageState extends State<SelecaoPoltronasPage> {
  // Mapa para armazenar o estado de seleção das poltronas
  Map<String, Set<int>> selectedSeats = {};

  // Mapa para definir a quantidade de poltronas por fileira
  final Map<String, int> seatCountPerRow = {
    'K': 22,
    'J': 20,
    'I': 16,
    'H': 16,
    'G': 16,
    'F': 16,
    'E': 16,
    'C': 16,
    'B': 14,
    'A': 14,
  };

  // Definição dos estados das poltronas
  final Set<String> occupiedSeats = {'A1', 'B2', 'C3', 'D4', 'E5', 'F6', 'G7', 'H8', 'I9', 'J10', 'K11', 'K12', 'K13', 'K14', 'K15', 'K16', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12', 'F13', 'F14', 'F15'};
  final Set<String> specialSeats = {'A5', 'A6', 'A7', 'A8', 'A9'};
  final Set<String> unavailableSeats = {'B10', 'B11'};

  @override
  Widget build(BuildContext context) {
    final maxSeatsInRow = seatCountPerRow.values.reduce((a, b) => a > b ? a : b);
    final screenWidth = MediaQuery.of(context).size.width;
    final margin = 4.0; // Margem adicional para o zoom
    final seatSpacing = 4.0; // Espaço entre as poltronas
    final corridorWidth = 28.0; // Largura do corredor

    // Calcular o tamanho da poltrona
    final totalPadding = (maxSeatsInRow - 1) * seatSpacing;
    final availableWidth = screenWidth - 2 * margin;
    final seatSize = (availableWidth - totalPadding - (seatCountPerRow.values.any((count) => count > 10) ? corridorWidth : 0)) / maxSeatsInRow;

    // Definir um tamanho fixo para a altura da poltrona
    final seatHeight = seatSize * 1.2; // Aumenta a altura da poltrona para garantir que o texto caiba

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de Poltronas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // InteractiveViewer para zoom das poltronas
            InteractiveViewer(
              boundaryMargin: EdgeInsets.all(margin),
              minScale: 1,
              maxScale: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: seatCountPerRow.entries.map((entry) {
                  final rowLetter = entry.key;
                  final seatCount = entry.value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(seatCount, (seatIndex) {
                        // Adiciona o corredor ao meio se necessário
                        if (seatCount > 6 && seatIndex == seatCount ~/ 2 && rowLetter != 'K') {
                          return SizedBox(width: corridorWidth); // Largura do corredor
                        }

                        final actualSeatIndex = seatIndex >= seatCount ~/ 2 && seatCount > 10 ? seatIndex - 1 : seatIndex;
                        final seatNumber = actualSeatIndex + 1;
                        final seatId = '$rowLetter$seatNumber';

                        final isSelected = selectedSeats[rowLetter]?.contains(seatNumber) ?? false;
                        final isOccupied = occupiedSeats.contains(seatId);
                        final isSpecial = specialSeats.contains(seatId);
                        final isUnavailable = unavailableSeats.contains(seatId);

                        Color seatColor;
                        if (isOccupied) {
                          seatColor = Colors.red;
                        } else if (isSpecial) {
                          seatColor = Colors.blue;
                        } else if (isUnavailable) {
                          seatColor = Colors.orange;
                        } else if (isSelected) {
                          seatColor = Colors.green;
                        } else {
                          seatColor = Colors.grey;
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (!isOccupied && !isUnavailable) {
                                if (isSelected) {
                                  selectedSeats[rowLetter]?.remove(seatNumber);
                                  if (selectedSeats[rowLetter]?.isEmpty ?? true) {
                                    selectedSeats.remove(rowLetter);
                                  }
                                } else {
                                  selectedSeats.putIfAbsent(rowLetter, () => {}).add(seatNumber);
                                }
                              }
                            });
                          },
                          child: Container(
                            width: seatSize,
                            height: seatHeight,
                            margin: EdgeInsets.symmetric(horizontal: seatSpacing / 2),
                            decoration: BoxDecoration(
                              color: seatColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                seatId,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: seatSize * 0.3, // Ajusta o tamanho da fonte
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Tela
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
              ),
              child: Text(
                'TELA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(1),
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(height: 32),
            //Legenda de cores
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16,
              children: [
                // Poltrona ocupada
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 8),
                    const Text('Ocupada'),
                  ],
                ),
                const SizedBox(width: 16),
                // Poltrona especial
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    const Text('Especial'),
                  ],
                ),
                const SizedBox(width: 16),
                // Poltrona indisponível
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    const Text('Indisponível'),
                  ],
                ),
                const SizedBox(width: 16),
                // Poltrona selecionada
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    const Text('Selecionada'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            //Poltronas Selecionadas
            if (selectedSeats.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Poltronas Selecionadas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 8,
                    children: selectedSeats.entries.map((entry) {
                      final rowLetter = entry.key;
                      final seatNumbers = entry.value.toList();

                      return Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '$rowLetter${seatNumbers.join(', $rowLetter')}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            Spacer(),
            // Botão Continuar
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {
                  if(selectedSeats.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PreenchimentoIngressosPage(selectedSeats: selectedSeats),
                    )
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        showCloseIcon: true,
                        content: Text('Por favor, selecione pelo menos uma poltrona'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12.0),
                ),
                child: const Text('Continuar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
