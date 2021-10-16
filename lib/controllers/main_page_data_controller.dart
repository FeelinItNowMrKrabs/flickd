import 'package:flickd_app/model/main_page_data.dart';
import 'package:flickd_app/model/movie.dart';
import 'package:flickd_app/services/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> _movies = [];
      print('lmaoe?');
      _movies = await _movieService.getPopularMovies(page: state.page!);
      print('ell lameo');
      state = state.copyWith(
        movies: [...state.movies!, ..._movies],
        page: state.page! + 1,
      );
    } catch (e) {}
  }
}
