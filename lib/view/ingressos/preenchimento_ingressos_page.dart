import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../politicas_meia_entrada_page.dart';

class PreenchimentoIngressosPage extends StatefulWidget {
  final Map<String, Set<int>> selectedSeats;

  const PreenchimentoIngressosPage({super.key, required this.selectedSeats});

  @override
  _PreenchimentoIngressosPageState createState() =>
      _PreenchimentoIngressosPageState();
}

enum Documento {
  cpf('CPF'),
  rg('RG');

  const Documento(this.tipo);

  final String tipo;
}

class _PreenchimentoIngressosPageState
    extends State<PreenchimentoIngressosPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _nameControllers = {};
  final Map<String, TextEditingController> _documentControllers = {};
  final Map<String, bool> _isHalfPriceMap = {};
  final Map<String, String> _documentTypeMap = {};

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores e o mapa para cada ingresso
    widget.selectedSeats.forEach((row, seats) {
      for (var seat in seats) {
        final seatId = '$row$seat';
        _nameControllers[seatId] = TextEditingController();
        _documentControllers[seatId] = TextEditingController();
        _isHalfPriceMap[seatId] = false;
        _documentTypeMap[seatId] =
            Documento.cpf.tipo; // Define CPF como o padrão
      }
    });
  }

  @override
  void dispose() {
    // Dispose dos controladores quando o widget for removido
    _nameControllers.forEach((_, controller) => controller.dispose());
    _documentControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preenchimento de Ingressos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: widget.selectedSeats.entries.expand((entry) {
                    final row = entry.key;
                    final seats = entry.value;

                    return seats.map((seat) {
                      final seatId = '$row$seat';
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text('Ingresso $seatId',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    Text(
                                        ' - ${_isHalfPriceMap[seatId]! ? 'R\$14,00' : 'R\$28,00'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary.withOpacity(0.7),
                                              //italico
                                              fontStyle: FontStyle.italic,
                                            )),
                                  ],
                                ),
                                TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: _nameControllers[seatId],
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira o nome';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(11),
                                        ],
                                        controller:
                                            _documentControllers[seatId],
                                        decoration: const InputDecoration(
                                          labelText: 'Documento',
                                          prefixIcon:
                                              Icon(Icons.badge_outlined),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Por favor, insira o documento';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    DropdownMenu(
                                      initialSelection: Documento.cpf,
                                      enableSearch: false,
                                      enableFilter: false,
                                      label: Text('Tipo'),
                                      // requestFocusOnTap: true,
                                      onSelected: (Documento? documento) {
                                        setState(() {
                                          _documentTypeMap[seatId] =
                                              documento!.tipo;
                                        });
                                      },
                                      dropdownMenuEntries: Documento.values
                                          .map<DropdownMenuEntry<Documento>>(
                                              (Documento documento) {
                                        return DropdownMenuEntry<Documento>(
                                          value: documento,
                                          label: documento.tipo,
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: Checkbox(
                                        value: _isHalfPriceMap[seatId],
                                        onChanged: (value) {
                                          setState(() {
                                            _isHalfPriceMap[seatId] = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'Meia entrada',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) =>
                                        const PoliticasMeiaEntradaPage(),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset(0.0, 0.0);
                                          const curve = Curves.easeInOut;

                                          var tween = Tween(begin: begin, end: end).chain(
                                            CurveTween(curve: curve),
                                          );

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Ao solicitar meia entrada você declara estar de acordo com nosso regulamento. Clique aqui para saber mais.',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                  ),
                                )                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList();
                  }).toList(),
                ),
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Processar os dados do formulário
                        final tickets =
                            widget.selectedSeats.entries.expand((entry) {
                          final row = entry.key;
                          final seats = entry.value;
                          return seats.map((seat) {
                            final seatId = '$row$seat';
                            return {
                              'seat': seatId,
                              'name': _nameControllers[seatId]!.text,
                              'document': _documentControllers[seatId]!.text,
                              'documentType': _documentTypeMap[seatId],
                              'isHalfPrice': _isHalfPriceMap[seatId]!,
                            };
                          });
                        }).toList();

                        // Exemplo: Exibir os dados ou enviar para o backend
                        print(tickets);

                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12.0),
                    ),
                    child: const Text('Confirmar', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
