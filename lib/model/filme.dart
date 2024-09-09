class Filme {
  int id;
  String titulo;
  String diretor;
  String genero;
  int ano;
  String sinopse;
  int classificacao;
  List<String> imagens;
  List<String> atores;
  int duracao;

  Filme({
    required this.id,
    required this.titulo,
    required this.diretor,
    required this.genero,
    required this.ano,
    required this.sinopse,
    required this.classificacao,
    required this.imagens,
    required this.atores,
    required this.duracao,
  });
}

List<Filme> filmesMock = [
  Filme(
    id: 1,
    titulo: 'Alien',
    diretor: 'Ridley Scott',
    genero: 'Ficção Científica',
    ano: 1979,
    sinopse: 'A tripulação da nave espacial Nostromo é acordada do sono criogênico para investigar um sinal recebido de um planeta próximo. O que eles não sabem é que o sinal é de perigo e que o planeta está cheio de seres alienígenas.',
    classificacao: 16,
    imagens: ['assets/images/alien.jpeg'],
    atores: ['Sigourney Weaver', 'Tom Skerritt', 'John Hurt'],
    duracao: 117,
  ),
  Filme(
    id: 2,
    titulo: 'Coringa',
    diretor: 'Todd Phillips',
    genero: 'Drama',
    ano: 2019,
    sinopse: 'Arthur Fleck trabalha como palhaço e é constantemente humilhado pela sociedade. Ele então inicia uma jornada de violência e caos que o transforma no vilão conhecido como Coringa.',
    classificacao: 16,
    imagens: ['assets/images/coringa.jpg'],
    atores: ['Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz'],
    duracao: 122,
  ),
  Filme(
    id: 3,
    titulo: 'Divertidamente 2',
    diretor: 'Pete Docter',
    genero: 'Animação',
    ano: 2015,
    sinopse: 'Riley é uma garota de 11 anos que precisa lidar com as emoções em sua mente. Alegria, Tristeza, Medo, Raiva e Nojinho são personagens que vivem na mente de Riley e a ajudam a lidar com as situações do dia a dia.',
    classificacao: 0,
    imagens: ['assets/images/divertidamente.jpg'],
    atores: ['Amy Poehler', 'Phyllis Smith', 'Richard Kind'],
    duracao: 102,
  ),
  Filme(
    id: 4,
    titulo: 'Django',
    diretor: 'Quentin Tarantino',
    genero: 'Ação',
    ano: 2012,
    sinopse: 'Django é um escravo liberto que, com a ajuda de um caçador de recompensas alemão, parte em busca de sua esposa que foi sequestrada por um cruel fazendeiro.',
    classificacao: 18,
    imagens: ['assets/images/django.jpg'],
    atores: ['Jamie Foxx', 'Christoph Waltz', 'Leonardo DiCaprio'],
    duracao: 165,
  ),
];

List<Filme> filmesBreveMock = [
  Filme(
    id: 1,
    titulo: 'Deadpool e Wolwerine',
    diretor: 'David Leitch',
    genero: 'Ação',
    ano: 2024,
    sinopse: 'Deadpool e Wolverine se unem para enfrentar um inimigo em comum.',
    classificacao: 18,
    imagens: ['assets/images/deadpool.jpg'],
    atores: ['Ryan Reynolds', 'Hugh Jackman'],
    duracao: 120,
  ),
  Filme(
    id: 2,
    titulo: 'Meu Malvado Favorito 4',
    diretor: 'Kyle Balda',
    genero: 'Animação',
    ano: 2024,
    sinopse: 'Gru e os Minions enfrentam um novo vilão.',
    classificacao: 0,
    imagens: ['assets/images/malvadof.jpg'],
    atores: ['Steve Carell', 'Pierre Coffin'],
    duracao: 90,
  ),
];
