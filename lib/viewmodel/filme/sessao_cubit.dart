import 'package:bloc/bloc.dart';
import 'package:cinego/model/sessao.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'sessao_state.dart';

class SessaoCubit extends Cubit<SessaoState> {
  SessaoCubit() : super(SessaoInitial());

  void carregarSessoesPorData(DateTime data) {
    emit(SessaoLoading());

    //Filtra por dd/MM/yyyy
    final sessoes = sessaoMock.where((sessao) =>
        DateFormat('dd/MM/yyyy').parse(sessao.data).isAtSameMomentAs(data))
        .toList();

    if (sessoes.isEmpty) {
      emit(SessaoEmpty());
    } else {
      emit(SessaoSuccess(sessoes));
    }
  }
}
