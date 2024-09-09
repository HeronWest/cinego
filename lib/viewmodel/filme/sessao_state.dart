part of 'sessao_cubit.dart';

@immutable
sealed class SessaoState {}

final class SessaoInitial extends SessaoState {}

final class SessaoLoading extends SessaoState {}

final class SessaoSuccess extends SessaoState {
  final List<Sessao> sessoes;
  SessaoSuccess(this.sessoes);
}

final class SessaoError extends SessaoState {
  final String mensagem;
  SessaoError(this.mensagem);
}

final class SessaoEmpty extends SessaoState {}
