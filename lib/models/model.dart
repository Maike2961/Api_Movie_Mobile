class Movie{
  final String nome;
  final String visualizacoes;
  final String backdropPath;
  final String PosterPath;
  final String data;
  final double pontuacao;

  Movie({required this.nome, required this.visualizacoes, required this.backdropPath, required this.PosterPath, required this.data, required this.pontuacao});

  factory Movie.fromMap(Map<String, dynamic> map){
    return Movie(
      nome: map["title"],
      backdropPath: map["backdrop_path"],
      visualizacoes: map["overview"],
      PosterPath: map["poster_path"],
      data: map["release_date"],
      pontuacao: map["vote_average"]
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'nome': nome,
      'backDropPath': backdropPath,
      'visualizacoes': visualizacoes,
      'posterPath': PosterPath,
      'data': data,
      'pontuacao': pontuacao
    };
  }
}