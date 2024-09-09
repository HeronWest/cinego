class Sessao {
  int id;
  int cinemaId;
  int filmeId;
  String sala;
  String data;
  String horario;

  Sessao({
    required this.id,
    required this.cinemaId,
    required this.filmeId,
    required this.sala,
    required this.data,
    required this.horario,
  });
}

List<Sessao> sessaoMock = [
  Sessao(
    id: 1,
    cinemaId: 1,
    filmeId: 1,
    sala: 'Sala 1',
    data: '30/08/2024',
    horario: '14:00',
  ),
  Sessao(
    id: 2,
    cinemaId: 1,
    filmeId: 1,
    sala: 'Sala 1',
    data: '30/08/2024',
    horario: '17:30',
  ),
  Sessao(
    id: 3,
    cinemaId: 1,
    filmeId: 1,
    sala: 'Sala 2',
    data: '30/08/2024',
    horario: '20:00',
  ),
  Sessao(
    id: 1,
    cinemaId: 1,
    filmeId: 1,
    sala: 'Sala 1',
    data: '31/08/2024',
    horario: '13:20',
  ),
  Sessao(
    id: 2,
    cinemaId: 1,
    filmeId: 1,
    sala: 'Sala 2',
    data: '31/08/2024',
    horario: '14:35',
  ),
  Sessao(
    id: 3,
    cinemaId: 1,
    filmeId: 1,
    sala: 'Sala 1',
    data: '31/08/2024',
    horario: '20:00',
  ),
];