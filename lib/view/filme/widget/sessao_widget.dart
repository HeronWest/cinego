import 'dart:developer';

import 'package:cinego/view/selecao_poltronas/selecao_poltronas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:cinego/viewmodel/filme/sessao_cubit.dart';


class SessaoWidget extends StatefulWidget {
  SessaoWidget({super.key});

  @override
  State<SessaoWidget> createState() => _SessaoWidgetState();
}

class _SessaoWidgetState extends State<SessaoWidget> {
  late final SessaoCubit cubit;
  DateTime dataSelecionada = DateTime.now();
  TextEditingController dataController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(DateTime.now()));

  @override
  void initState() {
    super.initState();
    cubit = SessaoCubit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.carregarSessoesPorData(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.4,
              child: TextField(
                controller: dataController,
                readOnly: true,
                onTap: () async {
                  final dataSelecionada = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 30)),
                  );

                  if (dataSelecionada != null) {
                    setState(() {
                      dataController.text = DateFormat('dd/MM/yyyy').format(dataSelecionada);
                    });
                    cubit.carregarSessoesPorData(dataSelecionada);
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Data',
                  prefixIcon: Icon(
                    Icons.calendar_today,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SessaoCubit, SessaoState>(
                builder: (context, state) {
                  if (state is SessaoLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SessaoSuccess) {
                    return ListView.builder(
                      itemCount: state.sessoes.length,
                      itemBuilder: (context, index) {
                        final sessao = state.sessoes[index];
                        return Card(
                          elevation: 2,
                          shadowColor: Theme.of(context).colorScheme.secondary,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => SelecaoPoltronasPage()));
                            },
                            title: Text('Horário: ${sessao.horario}h'),
                            subtitle: Text(sessao.sala),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SessaoEmpty) {
                    return Center(
                      child: Text('Nenhuma sessão encontrada'),
                    );
                  } else if (state is SessaoError) {
                    return Center(
                      child: Text(state.mensagem),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
