class Movie{
  final String nome;
  final String visualizacoes;
  final String backdropPath;
  final String PosterPath;

  Movie({required this.nome, required this.visualizacoes, required this.backdropPath, required this.PosterPath});

  factory Movie.fromMap(Map<String, dynamic> map){
    return Movie(
      nome: map["title"],
      backdropPath: map["backdrop_path"],
      visualizacoes: map["overview"],
      PosterPath: map["poster_path"]
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'nome': nome,
      'backDropPath': backdropPath,
      'visualizacoes': visualizacoes,
      'posterPath': PosterPath
    };
  }
}