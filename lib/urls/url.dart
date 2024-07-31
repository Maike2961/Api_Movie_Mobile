import 'dart:convert';
import 'package:movies_api/apikey.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/models/model.dart';

class Api{
  final upComingUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY";
  final popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY";
  final topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY";


  Future<List<Movie>> getUpcomingMovies() async{
    final request = await http.get(Uri.parse(upComingUrl));

    if(request.statusCode == 200){
      final List<dynamic> data = json.decode(request.body)['results'];

      List<Movie> movie = data.map((movies) => Movie.fromMap(movies)).toList();
      return movie;
    }else{
      throw Exception('Falha na request');
    }
  }
  
  Future<List<Movie>> getPopularMovies() async{
    final request = await http.get(Uri.parse(popularUrl));

    if(request.statusCode == 200){
      final List<dynamic> data = json.decode(request.body)['results'];

      List<Movie> movie = data.map((movies) => Movie.fromMap(movies)).toList();
      return movie;
    }else{
      throw Exception('Falha na request');
    }
  }
  
  Future<List<Movie>> getTopRatedMovies() async{
    final request = await http.get(Uri.parse(topRatedUrl));

    if(request.statusCode == 200){
      final List<dynamic> data = json.decode(request.body)['results'];

      List<Movie> movie = data.map((movies) => Movie.fromMap(movies)).toList();
      return movie;
    }else{
      throw Exception('Falha na request');
    }
  }

}