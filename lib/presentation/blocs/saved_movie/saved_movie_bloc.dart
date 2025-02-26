import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/saved_movie/saved_movie_event.dart';
import 'package:movie_app/presentation/blocs/saved_movie/saved_movie_state.dart';
import 'package:movie_app/model/movie.dart';

class SavedMovieBloc extends Bloc<SavedMovieEvent, SavedMovieState> {
  SavedMovieBloc() : super(SavedMovieInitial()) {
    on<ToggleSaveMovie>(_onToggleSaveMovie);
  }

  void _onToggleSaveMovie(ToggleSaveMovie event, Emitter<SavedMovieState> emit) {
    final currentState = state;

    if (currentState is SavedMovieLoaded) {
      final updatedMovies = List<Movie>.from(currentState.savedMovies);

      if (updatedMovies.any((movie) => movie.id == event.movie.id)) {
        updatedMovies.removeWhere((movie) => movie.id == event.movie.id);
      } else {
        updatedMovies.add(event.movie);
      }

      emit(SavedMovieLoaded(updatedMovies));
    } else {
      emit(SavedMovieLoaded([event.movie]));
    }
  }
}
